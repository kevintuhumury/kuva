module VCR
  class FilterData

    attr_reader :interaction

    def initialize(interaction)
      @interaction = interaction
    end

    def filter_before_record
      filter_keys.each { |key| interaction.filter! filter_attribute(key.to_s), "<#{key.to_s.upcase}>" }
    end

    def filter_before_playback
      filter_keys.each { |key| interaction.filter! "<#{key.to_s.upcase}>", filter_attribute(key.to_s) }
    end

    private

    def filter_keys
      [:oauth_consumer_key, :oauth_token, :oauth_token_secret, :oauth_nonce, :oauth_signature]
    end

    def filter_attribute(attribute)
      filter_headers(attribute) || filter_body(attribute)
    end

    def filter_headers(attribute)
      interaction.request.headers["Authorization"].map { |attr| attr.match(/#{attribute}#{regex_matcher}/).to_a.last }.first
    end

    def filter_body(attribute)
      interaction.response.body.match(/#{attribute}#{regex_matcher}/).to_a.last
    end

    def regex_matcher
      /([="]+)?([a-zA-Z0-9_%-]+)/
    end

  end
end
