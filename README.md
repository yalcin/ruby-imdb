Welcome to Ruby IMDB
--------------------

ruby-imdb is IMDB parsing library for Ruby.

Features
--------

- Dynamic Caching with MongoDB backend
- Object Oriented design
- Fast access to data

Installation
--------

Ruby IMDB is available as a Ruby Gem.


    [sudo] gem i ruby-imdb


Enable caching
--------------

    require 'rubygems'
    require 'imdb'

    IMDB::Configuration.caching = true
    IMDB::Configuration.db(:hostname => "localhost", :database => "imdb")

Usage
-----
    require 'rubygems'
    require 'imdb'

    s = IMDB::Search.new
    s.movie("fear and loathing in las vegas").each do
      |result|
      movie = IMDB::Movie.new(result.id)
      p movie.title
      movie.cast.each do
        |cast|
        p "#{cast.name} as #{cast.char}"
      end
      p movie.poster
    end

    movie = IMDB::Movie.new('0120669')
    p movie.poster

Examples
--------

Are Under features directory

Contribution
------------

All PRs and feature requests are welcome.

Clone the repo

    git clone git://github.com/yalcin/ruby-imdb.git

And open a PR.

Authors
-------
- Yalcin ACIKYILDIZ (mailto:yalcin@webliyacelebi.com)


This library is released under the terms of the GNU/GPL.

