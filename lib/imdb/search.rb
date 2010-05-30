module IMDB
    class Search
      def movie(keyword)
        doc = Nokogiri::HTML(open("http://www.imdb.com/find?s=tt&q=#{CGI.escape(keyword)}"))
        @ret_val = []
        doc.search('a[@href^="/title/tt"]').reject { |node|
            @ret_val.push(IMDB::Result.new(node["href"][/\d+/], node.content, "http://www.imdb.com#{node['href']}")) unless node.content.blank?
          }
        @ret_val
      end

      def to_hash
        i = 0
        tmp_hash = {}
        @ret_val.each {|r|
          tmp_hash[i] = r.to_hash
          i = i + 1
        }
        tmp_hash
      end

      def to_json
        to_hash.to_json
      end
  end # Search

  class Result < IMDB::Skeleton
    def initialize(imdb_id, title, link)
      super("Result",{:title => String, :link => String, :imdb_id => String}, [:imdb_id])
      @title = title
      @link = link
      @imdb_id = imdb_id
    end

    def title
      @title
    end

    def link
      @link
    end

    def imdb_id
      @imdb_id
    end
  end
end

