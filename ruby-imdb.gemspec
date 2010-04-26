spec = Gem::Specification.new do |s|
  s.name = 'ruby-imdb'
  s.version = '0.1'
  s.summary = "Ruby IMDB Parsing Library"
  s.description = %{Ruby IMDB Parsing Library}
  s.files = ["imdb.rb","LICENSE","README","Gemfile"] + Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
  s.require_path = 'lib'
  s.autorequire = 'builder'
  s.has_rdoc = false
  s.author = "Yalcin ACIKYILDIZ"
  s.email = "yalcin@webliyacelebi.com"
  s.homepage = "http://github.com/yalcin/ruby-imdb"
end

