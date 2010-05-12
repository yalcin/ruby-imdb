module IMDB
  class Skeleton
    attr_accessor :model, :method_names
    
    def initialize(*method_names)
      @method_names = method_names
      @model = Class.new do
        include MongoMapper::Document
        
        method_names.each { |m|
        key m, String
      }
      end
    end
    
    def to_json(*a)
      tmp_hash = {}
      
      @method_names.collect! { |x|
        evaled = eval("self.#{x}")
        if evaled.kind_of?(Array)
          tmp_hash[x] = evaled.collect! {|e|
            e
          }
        elsif evaled.kind_of?(String)
          tmp_hash[x] = evaled
        end
      }

      tmp_hash.to_json(*a)
    end
    
    def self.json_create(o)
      new(*o['data'])
    end    
  end
  

end