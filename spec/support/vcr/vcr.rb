require "vcr"

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = "spec/support/vcr/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = {
    record: :new_episodes,
    match_requests_on: [:method, :uri, :body]
  }

  config.filter_sensitive_data("<KUVA_API_KEY>") { Kuva.api_key }
  config.filter_sensitive_data("<KUVA_SHARED_SECRET>") { Kuva.shared_secret }
  config.filter_sensitive_data("<KUVA_ACCESS_TOKEN>") { Kuva.access_token }
  config.filter_sensitive_data("<KUVA_ACCESS_SECRET>") { Kuva.access_secret }
end
