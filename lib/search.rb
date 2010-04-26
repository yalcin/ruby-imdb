module IMDB
    class Search
    def self.movie(keyword)
      doc = Nokogiri::HTML(open("http://www.imdb.com/find?s=tt&q=#{CGI.escape(keyword)}"))
      ret_val = []
      doc.search('a[@href^="/title/tt"]').reject { |node|
          ret_val.push(IMDB::Result.new(node["href"][/\d+/], node.content, "http://www.imdb.com#{node['href']}"))
        }
      return ret_val
    end

  end # Search

  class Result
    attr_accessor :id, :title, :link, :year

    def initialize(id, title, link)
      @title = title
      @link = link
      @id = id
    end
  end
end

