require "rubygems"
require "bundler"
Bundler.require(:default)

require "cgi"
require "open-uri"

require "lib/movie"
require "lib/person"
require "lib/search"

IMDB::Search.movie("seker").each {|node| p node.link}

