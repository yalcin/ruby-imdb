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
    s.add_dependency "bundler"
    s.add_dependency "nokogiri"
  end
rescue LoadError
    puts "Jeweler not available. Install it with: gem install jeweler"
end
