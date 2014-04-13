module Kuva
  module Elements
    class PhotosetCollection

      def self.all
        new.photosets
      end

      def photosets
        @photosets ||= sets.each_with_object([]) do |photoset, collection|
          collection << Kuva::Elements::Photoset.find(photoset.id)
        end
      end

      private

      def sets
        flickr.photosets.getList
      end

    end
  end
end
