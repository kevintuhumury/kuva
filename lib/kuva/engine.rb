module Kuva
  class Engine < ::Rails::Engine
    isolate_namespace Kuva

    config.generators do |generator|
      generator.test_framework :rspec
    end
  end
end
