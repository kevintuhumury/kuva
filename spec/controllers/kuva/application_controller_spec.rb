require "spec_helper"

module Kuva
  describe ApplicationController do
    controller(ApplicationController) do
      def index
        render text: "testing before_action with anonymous controller"
      end
    end

    before do
      allow(Kuva).to receive(:api_key).and_return "<api_key>"
      allow(Kuva).to receive(:shared_secret).and_return "<shared_secret>"
      allow(Kuva).to receive(:access_token).and_return "<access_token>"
      allow(Kuva).to receive(:access_secret).and_return "<access_secret>"
    end

    context "configuring Kuva", :vcr do
      before { get :index }

      it "sets the API key" do
        expect(FlickRaw.api_key).to eq "<api_key>"
      end

      it "sets the shared secret" do
        expect(FlickRaw.shared_secret).to eq "<shared_secret>"
      end

      it "sets the access token" do
        expect(flickr.access_token).to eq "<access_token>"
      end

      it "sets the access secret" do
        expect(flickr.access_secret).to eq "<access_secret>"
      end
    end

  end
end
