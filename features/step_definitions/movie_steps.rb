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

Then /^the genres should be "(.*?)"$/ do |arg1|
  @movie.genres.should == arg1.split(/, */)
end

Then /^the rating should be a number between (\d+) and (\d+)$/ do |min,max|
  @movie.rating.should be_kind_of Numeric
  (min.to_f...max.to_f).should include @movie.rating
end

Then /the release year should be (\d+)/ do |year|
  Date.parse(@movie.release_date).year.should == year.to_i

end

Then /^the poster should be a link to an image$/ do
  @movie.poster.should be_kind_of String
  @movie.poster.should =~ /^http:.*jpg$/
end


Then /^the director should be "(.*?)"$/ do |arg1|
  @movie.director.should == arg1
end

Then /^it should have many photos$/ do
  @movie.photos.count.should > 3
  @movie.photos.each do |photo|
    photo.should =~ /^http:.*jpg$/
  end
end

Then /^the writers should be "(.*?)"$/ do |arg1|
  @movie.writers.map{|i|i.name}.join(", ").should == arg1
end

Then /^the short_description should be "(.*?)"$/ do |arg1|
  @movie.short_description.should == arg1
end

Then /^the title should be "(.*)"$/ do |title|
  @movie.title.should == title
end

Then /^the poster should be "(.*)"$/ do |poster|
  @movie.poster.should == poster
end

Then /^the movielength should be "(.*)"$/ do |duration|
  @movie.movielength.should be_kind_of Integer
  @movie.movielength.should == duration.to_i
end




