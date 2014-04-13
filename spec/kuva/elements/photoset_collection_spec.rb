require "spec_helper"

module Kuva
  module Elements
    describe PhotosetCollection, :vcr do

      describe ".retrieve" do
        subject { described_class.retrieve }

        it "fetches all photosets from Flickr" do
          expect(flickr.photosets).to receive(:getList).and_call_original
          subject
        end

        it "instantiates a new #{described_class} object" do
          expect(described_class).to receive(:new).and_call_original
          subject
        end
      end

      describe "#photosets" do
        subject { described_class.new.photosets }

        it "retrieves all photosets" do
          expect(flickr.photosets).to receive(:getList).and_call_original
          subject
        end

        it "returns an array" do
          expect(subject).to be_an Array
        end

        it "wraps the photosets into a Kuva::Elements::Photoset element" do
          subject.each do |photoset|
            expect(photoset).to be_a Kuva::Elements::Photoset
          end
        end
      end

    end
  end
end
