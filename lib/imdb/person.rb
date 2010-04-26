module IMDB
    class Person
    attr_accessor :name, :char, :profile, :picture

    def initialize(name, char, profile, picture)
      @name = name
      @char = char
      @profile = profile
      @picture = picture
    end
  end # Person
end

