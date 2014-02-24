require "spec_helper"

describe Kuva do

  describe ".setup" do
    it "yields itself" do
      Kuva.setup do |config|
        expect(config).to eq Kuva
      end
    end
  end

  context "setup block" do
    before do
      @old_api_key       = Kuva.api_key
      @old_shared_secret = Kuva.shared_secret
      @old_access_token  = Kuva.access_token
      @old_access_secret = Kuva.access_secret
    end

    it "configures the API key" do
      Kuva.setup do |config|
        config.api_key = "kuva-api-key"
      end

      expect(Kuva.api_key).to eq "kuva-api-key"
    end

    it "configures the shared secret" do
      Kuva.setup do |config|
        config.shared_secret = "super-secret"
      end

      expect(Kuva.shared_secret).to eq "super-secret"
    end

    it "configures the access token" do
      Kuva.setup do |config|
        config.access_token = "access-token"
      end

      expect(Kuva.access_token).to eq "access-token"
    end

    it "configures the access secret" do
      Kuva.setup do |config|
        config.access_secret = "secret-access-token"
      end

      expect(Kuva.access_secret).to eq "secret-access-token"
    end

    after do
      Kuva.setup do |config|
        config.api_key       = @old_api_key
        config.shared_secret = @old_shared_secret
        config.access_token  = @old_access_token
        config.access_secret = @old_access_secret
      end
    end
  end

end
