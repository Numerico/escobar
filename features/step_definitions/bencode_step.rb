Given /^"(\S*?)(\s\(.*\))?" is parsed (as|to) Bencode$/ do |param, type, direction|
  unless type.nil?
  	type = type.gsub /[\(\)\s]/, ''
    param = type == "Array" ? eval(param) : Kernel.send(type, param)
  end
  begin
    @output = direction == "to" ? BEncodr.bencode(param) : BEncodr.bdecode(param)
  rescue => @error
  end
end

Then /^I should get back "(.*?)" as "(.*?)"$/ do |string, type|
  @output.should be_a_kind_of eval(type)
  expected = type == "Array" ? eval(string) : Kernel.send(type, string)
  @output.should eq expected
end

Then /^an error should be raised$/ do
  @error.should_not be nil
  @error.should be_a_kind_of StandardError
end