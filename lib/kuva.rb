require "flickraw"
require "haml"

module Kuva
  mattr_accessor :api_key, :shared_secret, :access_token, :access_secret

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
