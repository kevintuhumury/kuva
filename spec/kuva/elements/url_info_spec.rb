require "spec_helper"

module Kuva
  module Elements
    describe UrlInfo do
      subject { described_class.new "8317914535", "9", "8217", "c7393787f3" }

      it "knows its id" do
        expect(subject.id).to eq "8317914535"
      end

      it "knows its farm" do
        expect(subject.farm).to eq "9"
      end

      it "knows its server" do
        expect(subject.server).to eq "8217"
      end

      it "knows its secret" do
        expect(subject.secret).to eq "c7393787f3"
      end
    end
  end
end
