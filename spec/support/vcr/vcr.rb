require "vcr"

VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :new_episodes }

  config.filter_sensitive_data("<SHARED_SECRET>") { FlickRaw.shared_secret }

  config.before_record do |interaction|
    VCR::FilterData.new(interaction).filter_before_record
  end

  config.before_playback do |interaction|
    VCR::FilterData.new(interaction).filter_before_playback
  end
end
