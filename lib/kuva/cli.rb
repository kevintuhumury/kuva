require "thor"

module Kuva
  class CLI < Thor

    desc "authorize", "Authorize the Kuva Rails Engine with Flickr."
    def authorize
      Authorizer.authorize
    end

  end
end
