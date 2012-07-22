module IMDB
  # IMDB generic interface.
  class Skeleton
    attr_accessor :model, :method_names

    def initialize(model_name = "", method_names = {}, keys = [])
      if IMDB::Configuration.caching
        @model = Class.new do
          include MongoMapper::Document
          set_collection_name model_name
          method_names.each { |m, t|
            key m, t
          }
        end
        class_eval do
          method_names.each_key { |meth|
            unless keys.include?(meth)
              old_meth = "old_#{meth}".to_sym
              alias_method old_meth, meth.to_sym
              define_method meth do
                k = keys.to_imdb_hash { |k| k; self.send(k) }

                @db_query = self.model.first(k)

                if @db_query.nil?
                  @db_query = self.model.new(keys.to_imdb_hash { |k| k; self.send(k)})
                  @db_query.save
                end

                if @db_query[meth].nil? or (@db_query[meth].length.zero? if @db_query[meth].kind_of?(Array))
                  a = send(old_meth)
                  if a.kind_of?(Array)
                    a.compact!
                    a.map! { |c|
                      if c.kind_of?(String)
                        c
                      else
                        c.to_hash
                      end
                    }
                    @db_query[meth] = a
                  else
                    @db_query[meth] = a
                  end
                  @db_query.save
                end
                @db_query[meth]
              end
            end
          }
        end
      end
      @method_names = method_names
    end

    # Serialize method's output to json
    def to_json(*a)
      tmp_hash = to_hash

      tmp_hash.to_json(*a)
    end

    def to_hash(*a)
      tmp_hash = {}
      @method_names.each_key { |x|
        evaled = self.send x
        if evaled.kind_of?(Array)
          tmp_hash[x] = evaled.collect! {|e|
            e
          }
        elsif evaled.kind_of?(String)
          tmp_hash[x] = evaled
        end
      }
      tmp_hash
    end

    def self.json_create(o)
      new(*o['data'])
    end
  end
end

