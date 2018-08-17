require "spec_helper"

module Kuva
  describe SetsController, type: :controller, vcr: true do
    describe "#index" do
      let(:view_index) { get :index, params: { use_route: :kuva } }

      let(:photosets) { assigns :photosets }

      it "knows its type" do
        view_index
        expect(photosets).to be_an Array
      end

      it "assigns the photoset collection with photosets" do
        view_index
        photosets.each do |photoset|
          expect(photoset).to be_a Kuva::Elements::Photoset
        end
      end

      it "retrieves the entire photoset collection" do
        expect(Kuva::Elements::PhotosetCollection).to receive :retrieve
        view_index
      end
    end

    describe "#show" do
      let(:view_photoset) { get :show, params: { id: "72157632367381040", use_route: :kuva } }

      let(:collection) { Kuva::Elements::PhotosetCollection.retrieve }
      let(:photoset)   { assigns :photoset }
      let(:photos)     { assigns :photos }

      it "knows its type" do
        view_photoset
        expect(photoset).to be_a Kuva::Elements::Photoset
      end

      it "assigns the photos of the specified photoset" do
        expect_any_instance_of(Kuva::Elements::Photoset).to receive(:with_photos).and_call_original
        view_photoset
      end

      it "finds the specified photoset within the entire photoset collection" do
        expect(Kuva::Elements::Photoset).to receive(:find).at_least(1).times.and_call_original
        view_photoset
      end
    end
  end
end
