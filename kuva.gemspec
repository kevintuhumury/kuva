$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'kuva/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name        = 'kuva'
  gem.version     = Kuva::VERSION
  gem.authors     = ['Kevin Tuhumury']
  gem.email       = ['kevin.tuhumury@gmail.com']
  gem.homepage    = 'http://github.com/kevintuhumury/kuva'
  gem.summary     = 'A Flickr gallery which can be mounted as a Rails Engine.'
  gem.description = 'This Rails Engine provides a Flickr gallery for use in your own Rails project.'
  gem.license     = 'MIT'

  gem.files       = Dir['Gemfile', 'Rakefile', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*']

  gem.add_dependency 'rails', '~> 5.2'
  gem.add_dependency 'flickraw', '~> 0.9'
  gem.add_dependency 'haml', '~> 5.0'
  gem.add_dependency 'sass-rails', '~> 5.0'
  gem.add_dependency 'coffee-rails', '~> 4.2'
  gem.add_dependency 'jquery-rails', '~> 4.3'
  gem.add_dependency 'compass-rails', '~> 3.1'
end
