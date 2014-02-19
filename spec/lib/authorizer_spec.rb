require "spec_helper"

module Kuva
  describe Authorizer do

    context ".authorize" do
      it "authorizes" do
        allow_any_instance_of(Authorizer).to receive :authorize
        described_class.authorize
      end
    end

    context "#authorize" do
      before do
        allow(STDIN).to receive(:gets).and_return "<authorization_code>"
      end

      let(:output) do
        capture(:stdout) { subject.authorize }
      end

      it "outputs a notice about the authentication url" do
        allow(subject).to receive(:authentication_url).and_return "<url>"
        expect(output).to include "\nCopy the URL below and follow the steps on Flickr to authorize kuva:\n<url>"
      end

      it "outputs a notice about the authentication code" do
        expect(output).to include "\nOnce you've authorized kuva, you'll receive a code (in the form of xxx-xxx-xxx) from Flickr. Copy and paste that code here:\n"
      end

      context "with a valid authentication code" do
        before do
          allow(subject).to receive(:flickr).and_return double.as_null_object
        end

        it "outputs a confirmation notice" do
          subject.stub_chain(:flickr, :test, :login, :username).and_return "<username>"
          subject.stub_chain(:flickr, :access_token).and_return "<access_token>"
          subject.stub_chain(:flickr, :access_secret).and_return "<access_secret>"

          expect(output).to include "\nYou've successfully authenticated kuva to use your account: '<username>' with the following token '<access_token>' and secret '<access_secret>'."
        end
      end

      context "with an invalid authentication code" do
        it "outputs an authentication error" do
          expect(output).to include "Authentication with Flickr failed: token_rejected"
        end

        context "with an incorrect API key and shared secret" do
          before do
            allow(FlickRaw).to receive(:api_key).and_return "<api_key>"
            allow(FlickRaw).to receive(:shared_secret).and_return "<shared_secret>"
          end

          it "raises a failed response error" do
            expect { flickr.get_access_token("<api_key>", "<shared_secret>", "<authentication_code>") }.to raise_error FlickRaw::OAuthClient::FailedResponse
            capture(:stdout) { subject.authorize }
          end
        end
      end
    end
  end
end
