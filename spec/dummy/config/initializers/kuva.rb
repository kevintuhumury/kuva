# Use this hook to configure the Kuva engine or more specifically
# your connection to the Flickr API. Flickr needs an API key and
# shared secret to authorize this application access to your Flickr
# account. Using the kuva:authorize Rake task you'll be able to
# retrieve an Access Token and Access Secret. These will enable
# Kuva to make authorized requests to the Flickr API.
Kuva.setup do |config|
  # The Flickr API requires an API key to connect your application
  # to your Flickr account. You can apply for an API key here:
  # http://www.flickr.com/services/apps/create/apply.
  config.api_key = "API_KEY"

  # Besides the API key, the Flickr API requires a shared secret.
  # Both the API key and shared secret are used to sign requests
  # to the Flickr API and to retrieve an Access Token and Access
  # Secret.
  config.shared_secret = "SHARED_SECRET"

  # As specified above, the Access Token can be retrieved by using
  # the kuva:authorize Rake task. Once you've done that, enable the
  # configuration option below and set it's value.
  # config.access_token = "ACCESS_TOKEN"

  # As specified above, both the Access Token as well as the Access
  # Secret can be retrieved by using the kuva:authorize Rake task.
  # Once you've done that, enable this configuration option and set
  # it's value.
  # config.access_secret = "ACCESS_SECRET"
end
