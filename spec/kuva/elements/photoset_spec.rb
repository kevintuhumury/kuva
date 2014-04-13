require "spec_helper"

module Kuva
  module Elements
    describe Photoset, :vcr do

      let(:photoset_id) { "72157632367381040" }

      context "#initialize" do
        subject { described_class.find photoset_id }

        it "saves a reference to the id" do
          expect(subject.id).to eq "72157632367381040"
        end

        it "saves a reference to the title" do
          expect(subject.title).to eq "Paris"
        end

        it "saves a reference to the description" do
          expect(subject.description).to eq "These shots were taken in Paris, France in December 2012. Most of them are taken with my Nikon D80 and Nikkor 50mm f/1.8 or Tokina 12-24mm f/4."
        end

        it "saves a reference to the number of views" do
          expect(subject.views).to eq "31"
        end

        it "saves a reference to the number of photos" do
          expect(subject.number_of_photos).to eq 28
        end

        it "saves a reference to the farm" do
          expect(subject.farm).to eq 9
        end

        it "saves a reference to the server" do
          expect(subject.server).to eq "8499"
        end

        it "saves a reference to the secret" do
          expect(subject.secret).to eq "eda82f692f"
        end

        it "saves a reference to the primary id" do
          expect(subject.primary).to eq "8318972536"
        end

        it "saves a reference to the created at date" do
          expect(subject.created_at).to eq "1356715289"
        end

        it "saves a reference to the updated at date" do
          expect(subject.updated_at).to eq "1356717162"
        end

        it "returns itself" do
          expect(subject).to be_a Kuva::Elements::Photoset
        end
      end

      context ".find" do
        it "fetches the photoset from Flickr specified by id" do
          expect(flickr.photosets).to receive(:getInfo).with(photoset_id: photoset_id).and_call_original
          described_class.find photoset_id
        end

        it "instantiates a new #{described_class} object" do
          expect(described_class).to receive(:new).with(any_args).and_call_original
          described_class.find photoset_id
        end
      end

      context "#with_photos" do
        subject { described_class.find photoset_id }

        it "returns an array" do
          expect(subject.with_photos).to be_an Array
        end

        it "returns an array with the size specified by number of photos" do
          expect(subject.with_photos.size).to eq subject.number_of_photos
        end

        it "wraps the photos into a Kuva::Elements::Photo element" do
          subject.with_photos.each do |photo|
            expect(photo).to be_a Kuva::Elements::Photo
          end
        end
      end

      context "#image_url" do
        subject { described_class.find photoset_id }

        it "instantiates a new URL info object to create an image URL" do
          expect(Kuva::Elements::UrlInfo).to receive(:new).with(any_args).and_call_original
          subject.image_url
        end

        it "generates an image URL for a large square image" do
          expect(subject.image_url).to eq "https://farm9.staticflickr.com/8499/8318972536_eda82f692f_q.jpg"
        end
      end

    end
  end
end
