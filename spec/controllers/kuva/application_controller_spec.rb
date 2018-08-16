require "spec_helper"

module Kuva
  describe ApplicationController, type: :controller do
    controller(ApplicationController) do
      def index
        render plain: "testing before_action with anonymous controller"
      end
    end

    context "configuring Kuva", vcr: true do
      it "sets the API key" do
        allow(Kuva).to receive(:api_key).and_return "<api_key>"
        get :index

        expect(FlickRaw.api_key).to eq "<api_key>"
      end

      it "sets the shared secret" do
        allow(Kuva).to receive(:shared_secret).and_return "<shared_secret>"
        get :index

        expect(FlickRaw.shared_secret).to eq "<shared_secret>"
      end

      it "sets the access token" do
        allow(Kuva).to receive(:access_token).and_return "<access_token>"
        get :index

        expect(flickr.access_token).to eq "<access_token>"
      end

      it "sets the access secret" do
        allow(Kuva).to receive(:access_secret).and_return "<access_secret>"
        get :index

        expect(flickr.access_secret).to eq "<access_secret>"
      end
    end

  end
end
