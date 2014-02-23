namespace :kuva do
  desc "Authorize the Kuva Rails Engine with Flickr."
  task authorize: :environment do
    Kuva::Authorizer.authorize
  end
end
