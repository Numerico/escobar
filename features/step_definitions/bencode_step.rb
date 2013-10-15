Given /^"(.*?)" is parsed as Bencode$/ do |string|
  begin
    @output = BEncodr.bdecode string
  rescue => @error
  end
end

Then /^I should get back "(.*?)" as a "(.*?)"$/ do |string, type|
  @output.should eq string
  @output.class.to_s.should eq type
end

Then /^an error should be raised$/ do
  @error.should_not be nil
  @error.should be_a_kind_of StandardError
end