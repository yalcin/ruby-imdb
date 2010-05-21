module IMDB
    class Person < IMDB::Skeleton
      def initialize(imdb_id, name, char, profile, picture)
        super("Person",{:imdb_id => String,
              :name => String,
              :char => String,
              :profile => String,
              :picture => String}, [:imdb_id, :profile])
        @imdb_id = imdb_id
        @name = name
        @char = char
        @profile = profile
        @picture = picture
      end

      def imdb_id
        @imdb_id
      end

      def name
        @name
      end

      def char
        @char
      end

      def profile
        @profile
      end

      def picture
        @picture
      end

      def profile
        @profile
      end

      def to_s
        "Name: #{@name} \n Char: #{@char} \n"
      end
    end # Person
end

