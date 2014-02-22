require "rails/generators/base"

module Kuva
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      desc "Creates a Kuva initializer in your application"

      def copy_initializer
        copy_file "kuva.rb", "config/initializers/kuva.rb"
      end

    end
  end
end
