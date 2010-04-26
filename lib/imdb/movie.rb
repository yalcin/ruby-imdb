module IMDB
    class Movie
    attr_accessor :title, :link, :cast, :id, :poster

    def initialize(id)
      @id = id
      @link =  "http://www.imdb.com/title/tt#{id}"
      doc = Nokogiri::HTML(open("#{@link}/fullcredits"))

      @title = doc.at("//head/meta[@name='title']")["content"].split(/\(\d+\)/)[0].strip!
      @poster = doc.at("a[@name='poster'] img")['src'][/http:.+/] + '.jpg' rescue nil
      @cast = []
      doc.search("table.cast tr").map do |link|
        picture = link.children[0].search("img")[0]["src"] rescue nil
        name = link.children[1].content rescue nil
        char = link.children[3].content rescue nil
        @cast.push(IMDB::Person.new(name, char, picture, picture)) if name and char and picture != nil
      end

    end
  end # Movie
end # IMDB

