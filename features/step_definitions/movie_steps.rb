begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')
require 'imdb'

Before do
end

After do
end

Given /I have movie name called "(.*)"/ do |n|
  @result = IMDB::Search.new.movie(n.to_s)
end

When /I get first entry from result set/ do
  @movie = IMDB::Movie.new(@result[0].imdb_id)
end

Then /^"(.*?)" should be act as "(.*?)"$/ do |person, act_as|
  @movie.cast.each do |c|
    if c.name == person and c.char == act_as
      c.name.should == person and c.char.should == act_as
    end
  end
end
