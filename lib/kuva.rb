require "flickraw"
require "haml"
require "sass-rails"
require "compass-rails"
require "jquery-rails"
require "coffee-rails"

module Kuva
  mattr_accessor :api_key, :shared_secret, :access_token, :access_secret

  mattr_accessor :cache_expiration
  @@cache_expiration = 7.days

  def self.setup
    yield self
  end
end

require "kuva/engine"
require "kuva/elements/url_info"
require "kuva/elements/photo"
require "kuva/elements/photoset"
require "kuva/elements/photoset_collection"
require "kuva/authorizer"
