$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "escobar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "escobar"
  s.version     = Escobar::VERSION
  s.authors     = ["numerico"]
  s.email       = ["webmaster@numerica.cl"]
  s.homepage    = "https://github.com/Numerico/escobar"
  s.summary     = "A Torrent Tracker as a Rails Engine"
  s.description = "TODO"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end

