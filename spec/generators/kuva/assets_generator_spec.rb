require "spec_helper"
require "generators/kuva/assets_generator"

module Kuva
  module Generators
    describe AssetsGenerator do
      destination File.expand_path("../../../../tmp", __FILE__)

      let(:javascript) { file("app/assets/javascripts/kuva.js.coffee") }
      let(:stylesheet) { file("app/assets/stylesheets/kuva.css.sass") }

      before do
        prepare_destination
        run_generator
      end

      it "generates app/assets/javascript/kuva.js.coffee" do
        expect(javascript).to exist
      end

      it "generates app/assets/stylesheets/kuva.css.sass" do
        expect(stylesheet).to exist
      end

      after do
        FileUtils.rm_rf File.expand_path("../../../../tmp", __FILE__)
      end
    end
  end
end
