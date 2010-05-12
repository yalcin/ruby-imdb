module IMDB
  class Configuration
    class << self
      def caching=(caching)
        @caching = caching
      end
      
      def caching
        @caching
      end
      
      def db(param={})
        @db_hostname = param[:hostname]
        @db_name = param[:database]
        if @caching
          MongoMapper.connection = Mongo::Connection.new(@db_hostname)
          MongoMapper.database = @db_name
        end
      end
    end
  end
end