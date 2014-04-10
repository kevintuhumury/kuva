module Kuva
  module Elements
    class Photo

      attr_reader :id, :title, :description, :farm, :server, :secret, :is_primary

      def initialize(attributes = {})
        @id          = attributes.try :id
        @title       = attributes.try :title
        @description = attributes.try :description
        @farm        = attributes.try :farm
        @server      = attributes.try :server
        @secret      = attributes.try :secret
        @is_primary  = attributes.try :is_primary

        self
      end

      def self.find(id)
        new flickr.photos.getInfo(photo_id: id)
      end

      def url
        FlickRaw.url info
      end

      def url_n
        FlickRaw.url_n info
      end

      private

      def info
        @info ||= Kuva::Elements::UrlInfo.new(id, farm, server, secret)
      end

    end
  end
end
