module IMDB
  class Search
    def movie(keyword)
      doc = Nokogiri::HTML(open("http://www.imdb.com/find?s=tt&q=#{CGI.escape(keyword)}"))
      @ret_val = []
      if doc.at("h1.header")   # we're already being redirected to movie's page
        single_result(doc)
      else
        result_list(doc)
      end
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

    private
    def single_result(doc)
      title = doc.at("h1.header")
      link = doc.at("link[rel=canonical]")["href"]
      title = title.text.strip.gsub(/\s+/, " ")
      @ret_val <<  IMDB::Result.new( link[/\d+/], title , link )
    end

    def result_list(doc)
      @ret_val = doc.search('a[@href^="/title/tt"]').reduce([]) do |ret_val,node|
        unless node.content.blank?
          link =  "http://www.imdb.com#{node['href']}"
          id   = node["href"][/\d+/]
          subtitle = node.parent.parent.content
          ret_val << IMDB::Result.new(id, node.parent.content, link, subtitle)
        end
        ret_val
      end
    end
  end # Search

  class Result < IMDB::Skeleton
    def initialize(imdb_id, title, link, extra="")
      super("Result",{:title => String, :link => String, :imdb_id => String, :extra => extra}, [:imdb_id])
      @title   = title
      @link    = link
      @imdb_id = imdb_id
      @extra   = extra
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

    def movie
      Movie.new(@imdb_id)
    end

    def extra
      @extra
    end
  end
end

