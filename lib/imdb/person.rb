module IMDB
    class Person < IMDB::Skeleton

    def initialize(name, char, profile, picture)
      super(:name, :char, :profile, :picture)
      @name = name
      @char = char
      @profile = profile
      @picture = picture
    end
    
    def name
      return @name
    end
    
    def char
      return @char
    end
    
    def profile
      return @profile
    end
    
    def picture
      return @picture
    end
  end # Person
end

