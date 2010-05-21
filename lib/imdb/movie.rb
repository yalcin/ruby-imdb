module IMDB
  # Get movie information with IMDB movie id.
  # @example Get Yahsi Bati movie title and cast listing [http://www.imdb.com/title/tt1567448/]
  #   m = IMDB::Movie.new('1567448')
  #   puts m.title
  class Movie < IMDB::Skeleton
    attr_accessor :link, :imdb_id


    def initialize(id_of)
      super("Movie", {:imdb_id => String,
            :poster => String,
            :title => String,
            :cast => Array,
            :photos => Array}, [:imdb_id])

      @imdb_id = id_of

      @link =  "http://www.imdb.com/title/tt#{@imdb_id}"
    end

    # Get movie poster address
    # @return [String]
    def poster
      doc.at("a[@name='poster'] img")['src'][/http:.+/] + '.jpg' rescue nil
    end

    # Get movie title
    # @return [String]
    def title
      doc.at("//head/meta[@name='title']")["content"].split(/\(\d+\)/)[0].strip!
    end

    # Get movie cast listing
    # @return [Array]
    def cast
      doc.search("table.cast tr").map do |link|
        picture = link.children[0].search("img")[0]["src"] rescue nil
        name = link.children[1].content rescue nil
        profile_id = link.children[1].search('a[@href^="/name/nm"]').first["href"].split("nm")[1].gsub(/\//,'') rescue nil
        char = link.children[3].content rescue nil
        IMDB::Person.new(@imdb_id, name, char, profile_id, picture) unless name.nil? and char.nil? and picture.nil? and profile_id.nil?
      end
    end

    # Get movie photos
    # @return [Array]
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

