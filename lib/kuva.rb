require "flickraw"
require "haml"

module Kuva
  mattr_accessor :api_key, :shared_secret, :access_token, :access_token_secret

  def self.setup
    yield self
  end
end

require "kuva/engine"
require "kuva/authorizer"
