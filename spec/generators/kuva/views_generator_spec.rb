require "spec_helper"
require "generators/kuva/views_generator"

module Kuva
  module Generators
    describe ViewsGenerator do
      destination File.expand_path("../../../../tmp", __FILE__)

      let(:views_directory) { "app/views/kuva" }

      let(:sets_index)  { file("#{views_directory}/sets/index.html.haml") }
      let(:sets_show)   { file("#{views_directory}/sets/show.html.haml") }
      let(:photos_show) { file("#{views_directory}/photos/show.html.haml") }

      before do
        prepare_destination
        run_generator
      end

      it "generates the app/views/kuva/photos/show.html.haml view" do
        expect(photos_show).to exist
      end

      it "generates the app/views/kuva/sets/index.html.haml view" do
        expect(sets_index).to exist
      end

      it "generates the app/views/kuva/sets/show.html.haml view" do
        expect(sets_show).to exist
      end

      after do
        FileUtils.rm_rf File.expand_path("../../../../tmp", __FILE__)
      end
    end
  end
end
