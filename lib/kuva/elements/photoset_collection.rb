module Kuva
  module Elements
    class PhotosetCollection

      def self.all
        new.photosets
      end

      def photosets
        @photosets ||= cached.each_with_object([]) do |photoset, collection|
          collection << Kuva::Elements::Photoset.find(photoset.id)
        end
      end

      private

      def cached
        Rails.cache.fetch "photosets", expires_in: Kuva.cache_expiration do
          flickr.photosets.getList
        end
      end

    end
  end
end
