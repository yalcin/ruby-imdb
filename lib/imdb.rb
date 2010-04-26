require "rubygems"
require "bundler"
Bundler.require(:default)

require "cgi"
require "open-uri"

require "movie"
require "person"
require "search"

#IMDB::Search.movie("fight club").each do
#  |result|
#  movie = IMDB::Movie.new(result.id)
#  p movie.title
#  movie.cast.each do
#    |cast|
#    p "#{cast.name} as #{cast.char}"
#  end
#  p movie.poster
#end

#movie = IMDB::Movie.new('0133093')
#p movie.poster

