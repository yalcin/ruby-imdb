module IMDB
  class Movie
    attr_accessor :link, :id

    def initialize(id)
      @id = id
      @link =  "http://www.imdb.com/title/tt#{id}"
    end
    
    def poster
      doc.at("a[@name='poster'] img")['src'][/http:.+/] + '.jpg' rescue nil
    end
    
    def title
      doc.at("//head/meta[@name='title']")["content"].split(/\(\d+\)/)[0].strip!
    end

    def cast
      doc.search("table.cast tr").map do |link|
        picture = link.children[0].search("img")[0]["src"] rescue nil
        name = link.children[1].content rescue nil
        char = link.children[3].content rescue nil
        IMDB::Person.new(name, char, picture, picture) if name and char and picture != nil
      end
    end
      
    def photos
      begin
        doc.search("img").map do |img|
          unless img["src"][/_CR/].nil?
            img["src"]
          end
        end
      rescue 
        nil
      end
    end
    
    private
  
    def doc
      if caller[0] =~ /`([^']*)'/ and $1 == "cast"
        @doc = Nokogiri::HTML(open("#{@link}/fullcredits"))
      else
        @doc = Nokogiri::HTML(open("#{@link}"))
      end
      
    end
  end # Movie
end # IMDB

