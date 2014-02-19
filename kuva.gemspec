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

  gem.add_dependency "rails", "~> 4.0.3"

  gem.add_development_dependency "rspec-rails"
  gem.add_development_dependency "capybara"
  gem.add_development_dependency "sqlite3"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "coveralls"
end
