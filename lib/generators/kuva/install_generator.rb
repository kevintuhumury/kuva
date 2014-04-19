require "rails/generators/base"

module Kuva
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a Kuva initializer in your application"

      def copy_initializer
        copy_file "kuva.rb", "config/initializers/kuva.rb"
      end

      def copy_locale
        copy_file "../../../../config/locales/frontend.yml", "config/locales/kuva.en.yml"
      end

      def create_assets
        generate "kuva:assets"
      end

      def mount_engine
        if original_routes.include? "mount Kuva::Engine"
          say_status "skip", "mounting of Kuva into config/routes.rb", :yellow
        else
          route 'mount Kuva::Engine => "/kuva"'
        end
      end

      private

      def original_routes
        File.read "config/routes.rb"
      end

    end
  end
end
