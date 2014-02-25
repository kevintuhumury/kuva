require "spec_helper"
require "generators/kuva/install_generator"

module Kuva
  module Generators
    describe InstallGenerator do
      destination File.expand_path("../../../../tmp", __FILE__)

      let(:initializer) { file("config/initializers/kuva.rb") }

      before do
        prepare_destination
        run_generator
      end

      it "generates config/initializers/kuva.rb" do
        expect(initializer).to exist
      end

      after do
        FileUtils.rm_rf File.expand_path("../../../../tmp", __FILE__)
      end
    end
  end
end
