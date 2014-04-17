require "rails/generators/base"

module Kuva
  module Generators
    class AssetsGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates the required Kuva assets in your application"

      def copy_assets
        copy_file "kuva.js.coffee", "app/assets/javascripts/kuva.js.coffee"
        copy_file "kuva.css.sass",  "app/assets/stylesheets/kuva.css.sass"
      end

    end
  end
end
