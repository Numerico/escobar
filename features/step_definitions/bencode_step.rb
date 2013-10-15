Given /^"(\S*?)(\s\(.*\))?" is parsed (as|to) Bencode$/ do |string, type, direction|
  string = Kernel.send type.gsub(/[\(\)\s]/,''), string unless type.nil?
  begin
    @output = direction == "to" ? BEncodr.bencode(string) : BEncodr.bdecode(string)
  rescue => @error
  end
end

Then /^I should get back "(.*?)" as "(.*?)"$/ do |string, type|
  @output.should be_a_kind_of eval(type)
  @output.should eq Kernel.send type, string
end

Then /^an error should be raised$/ do
  @error.should_not be nil
  @error.should be_a_kind_of StandardError
end