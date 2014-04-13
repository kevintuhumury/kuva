# encoding: UTF-8
require "spec_helper"

module Kuva
  module Elements
    describe Photo, :vcr do

      let(:photo_id) { "8317914535" }

      context "#initialize" do
        subject { described_class.find photo_id }

        it "saves a reference to the id" do
          expect(subject.id).to eq "8317914535"
        end

        it "saves a reference to the title" do
          expect(subject.title).to eq "Musée du Louvre"
        end

        it "saves a reference to the description" do
          expect(subject.description).to eq "These shots were taken in Paris, France in December 2012. Most of them are taken with my Nikon D80 and Nikkor 50mm f/1.8 or Tokina 12-24mm f/4."
        end

        it "saves a reference to the farm" do
          expect(subject.farm).to eq 9
        end

        it "saves a reference to the server" do
          expect(subject.server).to eq "8217"
        end

        it "saves a reference to the secret" do
          expect(subject.secret).to eq "c7393787f3"
        end

        it "does NOT set the is_primary boolean" do
          expect(subject.is_primary).to be_nil
        end

        it "returns itself" do
          expect(subject).to be_a Kuva::Elements::Photo
        end
      end

      context ".find" do
        it "fetches the photo from Flickr specified by id" do
          expect(flickr.photos).to receive(:getInfo).with(photo_id: photo_id).and_call_original
          described_class.find photo_id
        end

        it "instantiates a new #{described_class} object" do
          expect(described_class).to receive(:new).with(any_args).and_call_original
          described_class.find photo_id
        end
      end

      context "image URLs" do
        subject { described_class.find photo_id }

        it "instantiates a new URL info object to create image URLs" do
          expect(Kuva::Elements::UrlInfo).to receive(:new).with(any_args).and_call_original
          subject.url
        end

        it "generates an image URL for a default sized (medium) image" do
          expect(subject.url).to eq "https://farm9.staticflickr.com/8217/8317914535_c7393787f3.jpg"
        end

        it "generates an image URL for a n-sized (small 320) image" do
          expect(subject.url_n).to eq "https://farm9.staticflickr.com/8217/8317914535_c7393787f3_n.jpg"
        end
      end
    end
  end
end
