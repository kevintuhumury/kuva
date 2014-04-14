require "spec_helper"

module Kuva
  describe PhotoController, :vcr do
    let(:view_photo) { get :show, id: photo_id, set_id: "72157632367381040", use_route: :kuva }

    let(:photo_id)   { "8317914535" }
    let(:photo)      { assigns :photo }

    describe "#show" do
      it "assigns the photo" do
        view_photo
        expect(photo).to be_a Kuva::Elements::Photo
      end

      it "finds the photo" do
        expect(Kuva::Elements::Photo).to receive(:find).with(photo_id).and_call_original
        view_photo
      end
    end
  end
end
