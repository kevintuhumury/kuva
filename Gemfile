source "https://rubygems.org"

# Declare your gem's dependencies in kuva.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

group :development, :test do
  gem "rspec-rails"
  gem "sqlite3"
end

group :test do
  gem "capybara"
  gem "vcr"
  gem "webmock", "~> 1.15.0"
  gem "simplecov"
  gem "coveralls"
end
