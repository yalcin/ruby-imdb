require 'rake'

begin
  require "jeweler"
  Jeweler::Tasks.new do |s|
    s.name = "ruby-imdb"
    s.summary = "Ruby IMDB Parsing Library"
    s.description = s.summary
    s.email = "yalcin@webliyacelebi.com"
    s.homepage = "http://github.com/yalcin/ruby-imdb"
    s.authors = ["Yalcin Acikyildiz"]
    s.files =  FileList["[A-Za-z]*", "{lib,features}/**/*", ".gitignore"]
    s.add_dependency "nokogiri", ">= 1.4.1"
    s.add_dependency "json", ">= 1.4.3"
    s.add_dependency "mongo", ">= 1.0.1"
    s.add_dependency "mongo_mapper", ">= 0.7.5"
    s.add_dependency "chronic", ">= 0.2.3"
    #s.add_dependency "rack", ">= 1.1.0"
  end
rescue LoadError
    puts "Jeweler not available. Install it with: gem install jeweler"
end
