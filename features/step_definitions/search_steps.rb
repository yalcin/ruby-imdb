begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'imdb'

Before do
end

After do
end

Given /I have keyword "(.*)" for the search/ do |n|
  @result = IMDB::Search.new.movie(n.to_s)
end

Then /the result should be equal or greater than (\d+)/ do |result|
  @result.length.should >= result.to_i
end
Then /the result should be equal to (\d+)/ do |result|
  @result.length.should == result.to_i
end
Then /the first title should be "(.*)"/ do |title|
  @result.first.title.should == title
end
