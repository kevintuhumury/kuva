module Kuva
  class ApplicationController < ::ApplicationController

    before_action :configure_kuva

    private

    def configure_kuva
      FlickRaw.api_key       = Kuva.api_key
      FlickRaw.shared_secret = Kuva.shared_secret

      flickr.access_token    = Kuva.access_token
      flickr.access_secret   = Kuva.access_secret
    end

  end
end
