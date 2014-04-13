module Kuva
  module Elements
    class Photoset

      attr_reader :id, :title, :description, :views, :number_of_photos, :farm, :server, :secret, :primary, :created_at, :updated_at

      def initialize(attributes = {})
        @id               = attributes.try :id
        @title            = attributes.try :title
        @description      = attributes.try :description
        @views            = attributes.try :count_views
        @number_of_photos = attributes.try :photos
        @farm             = attributes.try :farm
        @server           = attributes.try :server
        @secret           = attributes.try :secret
        @primary          = attributes.try :primary
        @created_at       = attributes.try :date_create
        @updated_at       = attributes.try :date_update

        self
      end

      def self.find(id)
        new flickr.photosets.getInfo(photoset_id: id)
      end

      def with_photos
        @with_photos ||= photos.each_with_object([]) do |photo, collection|
          collection << Kuva::Elements::Photo.new(photo)
        end
      end

      def image_url
        FlickRaw.url_q Kuva::Elements::UrlInfo.new primary, farm, server, secret
      end

      private

      def photos
        flickr.photosets.getPhotos(photoset_id: id).photo
      end

    end
  end
end
