module Kuva
  class PhotoController < ApplicationController

    def show
      @photo = Kuva::Elements::Photo.find params[:id]
    end

  end
end
