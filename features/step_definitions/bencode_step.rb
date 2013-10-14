Given(/^"(.*?)" is parsed as Bencode$/) do |string|
  @output = BEncodr.bdecode string
end

Then(/^I should get back "(.*?)" as a "(.*?)"$/) do |string, type|
  @output.should eq string
  @output.class.to_s.should eq type
end
