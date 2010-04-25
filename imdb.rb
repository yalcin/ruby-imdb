require "rubygems"
require "bundler"
Bundler.require(:default)

require "cgi"
require "open-uri"

module IMDB
  class Movie
    attr_accessor :title, :link, :cast

    def initialize(title, link)
      @title = title
      @link =  "http://www.imdb.com#{link}"

      doc = Nokogiri::HTML(open("http://www.imdb.com/title/tt0791309/fullcredits"))
      @cast = []
      doc.search("table.cast tr").map do |link|
        picture = link.children[0].search("img")[0]["src"] rescue nil
        name = link.children[1].content rescue nil
        char = link.children[3].content rescue nil
        @cast.push(IMDB::Person.new(name, char, picture, picture)) if name and char and picture != nil
      end

    end
  end # Movie

  class Search
    def self.movie(keyword)
      doc = Nokogiri::HTML(open("http://www.imdb.com/find?s=all&q=#{CGI.escape(keyword)}"))
      ret_val = []
      doc.xpath("//div[@id='main']/table[1]/tr/td[3]/a").each { |node|
          ret_val.push(IMDB::Result.new(node.content, doc.at("head/link[@rel='canonical']")['href']))
        }
        return ret_val
    end

  end # Search

  class Result
    attr_accessor :title, :link, :year

    def initialize(title, link)
      @title = title
      @link = link
    end
  end

  class Person
    attr_accessor :name, :char, :profile, :picture

    def initialize(name, char, profile, picture)
      @name = name
      @char = char
      @profile = profile
      @picture = picture
    end
  end # Person
end # IMDB

IMDB::Search.movie("seker").each {|node| p node.link}

