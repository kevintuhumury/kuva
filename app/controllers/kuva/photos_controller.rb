module Kuva
  class PhotosController < ApplicationController

    def show
      @photo    = Kuva::Elements::Photo.find params[:id]
      @photoset = Kuva::Elements::Photoset.find params[:set_id]
    end

  end
end
