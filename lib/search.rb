module IMDB
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
end

