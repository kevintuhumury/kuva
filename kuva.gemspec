$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kuva/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = "kuva"
  gem.version     = Kuva::VERSION
  gem.authors     = ["Kevin Tuhumury"]
  gem.email       = ["kevin.tuhumury@gmail.com"]
  gem.homepage    = "http://github.com/kevintuhumury/kuva"
  gem.summary     = "A Flickr gallery which can be mounted as a Rails Engine."
  gem.description = "This Rails Engine provides a Flickr gallery for use in your own Rails project."

  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- spec/**/*`.split("\n")

  gem.add_dependency "rails", "~> 4.1.0"
  gem.add_dependency "flickraw"
  gem.add_dependency "haml"
  gem.add_dependency "sass-rails", "~> 4.0.0"
  gem.add_dependency "coffee-rails", "~> 4.0.0"
  gem.add_dependency "compass-rails"
end
