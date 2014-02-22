module Kuva
  class Authorizer

    attr_reader :out

    def self.authorize
      new.authorize
    end

    def initialize
      FlickRaw.api_key       = Kuva.api_key
      FlickRaw.shared_secret = Kuva.shared_secret
    end

    def authorize
      puts I18n.t("kuva.authentication.url", url: authentication_url)
      puts I18n.t("kuva.authentication.code")

      begin
        flickr.get_access_token oauth_token, oauth_token_secret, authorization_code
        puts I18n.t("kuva.authentication.success", account: flickr.test.login.username, token: flickr.access_token, secret: flickr.access_secret)
      rescue FlickRaw::OAuthClient::FailedResponse => error
        puts I18n.t("kuva.authentication.error", message: error)
      end
    end

    private

    def authorization_code
      STDIN.gets.strip
    end

    def authentication_url
      flickr.get_authorize_url oauth_token, perms: "read"
    end

    def oauth_token
      token["oauth_token"]
    end

    def oauth_token_secret
      token["oauth_token_secret"]
    end

    def token
      @token ||= flickr.get_request_token
    end

  end
end
