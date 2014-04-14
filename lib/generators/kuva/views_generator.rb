require "rails/generators/base"

module Kuva
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views/kuva", __FILE__)

      desc "Copies the Kuva views to your application"

      def copy_views
        view_directory :photos
        view_directory :sets
      end

      private

      def view_directory(name)
        directory name.to_s, "app/views/kuva/#{name}"
      end

    end
  end
end
