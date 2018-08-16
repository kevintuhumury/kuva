require "spec_helper"

module Kuva
  describe Authorizer do

    context ".new" do
      before do
        allow(Kuva).to receive(:api_key).and_return "<api_key>"
        allow(Kuva).to receive(:shared_secret).and_return "<shared_secret>"
      end

      it "configures the FlickRaw API key" do
        described_class.new
        expect(FlickRaw.api_key).to eq "<api_key>"
      end

      it "configures the FlickRaw shared secret" do
        described_class.new
        expect(FlickRaw.shared_secret).to eq "<shared_secret>"
      end
    end

    context ".authorize" do
      it "authorizes" do
        allow_any_instance_of(Authorizer).to receive :authorize
        described_class.authorize
      end
    end

    context "#authorize" do
      before { allow(STDIN).to receive(:gets).and_return "<authorization_code>" }

      context "with a valid authentication code" do
        before { allow(subject).to receive(:flickr).and_return double.as_null_object }

        it "outputs a notice about the authentication url" do
          allow(subject).to receive(:authentication_url).and_return "<url>"
          expect { subject.authorize }.to output(/\nCopy the URL below and follow the steps on Flickr to authorize Kuva:\n<url>/).to_stdout
        end

        it "outputs a notice about the authentication code" do
          expect { subject.authorize }.to output(/\nOnce you've authorized Kuva, you'll receive a code \(in the form of xxx-xxx-xxx\) from Flickr. Copy and paste that code here and press <enter>:\n/).to_stdout
        end

        it "outputs a confirmation notice" do
          allow(Kuva).to receive(:api_key).and_return "<api_key>"
          allow(Kuva).to receive(:shared_secret).and_return "<shared_secret>"
          allow(subject).to receive_message_chain(:flickr, :test, :login, :username).and_return "<username>"
          allow(subject).to receive_message_chain(:flickr, :access_token).and_return "<access_token>"
          allow(subject).to receive_message_chain(:flickr, :access_secret).and_return "<access_secret>"

          expect { subject.authorize }.to output(/\n<username>, you've successfully authorized Kuva with Flickr. As you can see we've received your username. Besides that we've got the following access token '<access_token>' and access secret '<access_secret>'. Both the API key, shared secret and the previously mentioned variables should be saved for later use. They're all listed below. Place them in `config\/initializers\/kuva.rb` and you're good to go.\n\n\tapi_key:       <api_key>\n\tshared_secret: <shared_secret>\n\taccess_token:  <access_token>\n\taccess_secret: <access_secret>\n\n/).to_stdout
        end
      end

      context "with an invalid authentication code" do
        it "outputs an authentication error" do
          expect { subject.authorize }.to output(/Authentication with Flickr failed: token_rejected/).to_stdout
        end

        context "with an incorrect API key and shared secret" do
          before do
            allow(FlickRaw).to receive(:api_key).and_return "<api_key>"
            allow(FlickRaw).to receive(:shared_secret).and_return "<shared_secret>"
          end

          it "raises a failed response error" do
            expect { flickr.get_access_token("<api_key>", "<shared_secret>", "<authentication_code>") }.to raise_error FlickRaw::OAuthClient::FailedResponse
            expect { subject.authorize }.to output(/.*/).to_stdout
          end
        end
      end
    end
  end
end
