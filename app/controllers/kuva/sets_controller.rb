module Kuva
  class SetsController < ApplicationController

    def index
      @photosets = photoset_collection
    end

    def show
      @photoset = photoset
      @photos   = photoset.with_photos
    end

    private

    def photoset
      photoset_collection.find { |photoset| photoset.id == params[:id] }
    end

    def photoset_collection
      @photoset_collection ||= Kuva::Elements::PhotosetCollection.retrieve
    end

  end
end
