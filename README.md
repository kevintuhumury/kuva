# Kuva

[![Build Status](https://travis-ci.org/kevintuhumury/kuva.png)](https://travis-ci.org/kevintuhumury/kuva)
[![Gem Version](https://badge.fury.io/rb/kuva.svg)](http://badge.fury.io/rb/kuva)
[![Dependency Status](https://gemnasium.com/kevintuhumury/kuva.png)](https://gemnasium.com/kevintuhumury/kuva)
[![Code Climate](https://codeclimate.com/github/kevintuhumury/kuva.png)](https://codeclimate.com/github/kevintuhumury/kuva)
[![Coverage Status](https://coveralls.io/repos/kevintuhumury/kuva/badge.png)](https://coveralls.io/r/kevintuhumury/kuva)

A Flickr gallery which can be mounted as a Rails engine. Once mounted, you can view your own photosets and its photos. This is offered in its current state, but [new features](https://github.com/kevintuhumury/kuva#wishlist) will be added as soon as possible (or you can [contribute](https://github.com/kevintuhumury/kuva#contributing) to this gem to make that happen yourself)

## Installation

Add this line to your application's Gemfile:

    gem "kuva"

And then execute:

    $ bundle

Or install it yourself:

    $ gem install kuva

## Authorize Kuva

To use Kuva you'll need to authorize the gem with Flickr. In order to do that, you'll need to apply for an API key and shared secret. When that's done, you'll need to supply those values to the Kuva initializer. Afterwards you need run the `kuva:authorize` rake task, but first things first, so let's start at step one.

### Step 1: Apply for an API key and shared secret

You can retrieve an API key and shared secret from Flickr by [creating a new application](https://www.flickr.com/services/apps). Just follow the instructions and once you've received the API key and shared secret, move on to the step two.

### Step 2: Filling in Kuva's configuration options

Now that we've got an API key and shared secret, let's put them to use. Configuring Kuva is pretty easy. First run the following:

	rails generate kuva:install

This will do several things for you as you will see in the generated output. It will among other things:

- Install an [initializer](https://github.com/kevintuhumury/kuva#complete-the-kuva-initializer) at `config/initializer/kuva.rb`.
- Add the [i18n locale](https://github.com/kevintuhumury/kuva#adjusting-the-i18n-labels) at `config/locales/kuva.en.yml`.
- Generate the required assets at `app/assets/javascripts/kuva.js.coffee` and `app/assets/stylesheets/kuva.css.sass` which will load the actual Kuva assets from the Rails engine. You're also able to [adjust the default views](https://github.com/kevintuhumury/kuva#adjusting-the-default-views).
- [Mount](https://github.com/kevintuhumury/kuva#mount-your-engines) the Kuva::Engine in `config/routes.rb`.

As listed above, the `kuva:install` generator will install an initializer called `config/initializer/kuva.rb` in your Rails application. Use the previously acquired variables (from Flickr) to fill in the Kuva setup block in that file.

Hang on, we're almost there. Now move on to part three.

### Step 3: Run the `kuva:authorize` rake task

    rake kuva:authorize

Something like the following will be shown to you:

    Copy the URL below and follow the steps on Flickr to authorize Kuva:
    https://api.flickr.com/services/oauth/authorize?oauth_token=OAUTH_TOKEN&perms=read

    Once you've authorized Kuva, you'll receive a code (in the form of xxx-xxx-xxx) from Flickr. Copy and paste that code here and press <enter>:

Copy the URL (as requested) and paste it in your browser. Next copy the code (xxx-xxx-xxx) from Flickr, paste it in your shell and press enter. Once you've done that, you'll receive the access token and access secret from Flickr:

    USERNAME, you've successfully authorized Kuva with Flickr. As you can see we've received your username. Besides that we've got the following access token 'ACCESS_TOKEN' and access secret 'ACCESS_SECRET'. Both the API key, shared secret and the previously mentioned variables should be saved for later use. They're all listed below. Place them in `config/initializers/kuva.rb` and you're good to go.

	api_key:       API_KEY
	shared_secret: SHARED_SECRET
	access_token:  ACCESS_TOKEN
	access_secret: ACCESS_SECRET

You're now done authorizing Kuva! Take note of the variables and save them, since you'll need them to use Kuva. Now let's move on to the configuration of Kuva.

## Configuration

As described in the previous part we've now got the required variables, so let's actually use them. 

### Complete the Kuva initializer

The `rails generate kuva:install` will (among other things) install an initializer called `config/initializer/kuva.rb` in your Rails application. You've already filled in your API key and shared secret in that file. 

Before you can use Kuva in your Rails application you'll have to set the `access token` and `access secret`. So let's fill in the missing configuration options with the acquired variables. 

Besides the `API key`, `shared secret`, `access token` and `access secret` you're able to set the `cache expiration` of the Flickr API calls in the initializer as well.

### Mount your engines

Kuva will be mounted for you automatically. By default it will use the path `/kuva`, but you can specify any path you would like Kuva to be available on.

So, if you would like to adjust it, go to your `config/routes.rb` file and change the path in the following line of code to something of your liking:

	mount Kuva::Engine => "/kuva"

That's it!

### Configuring your development environment

When you decide to contribute to this gem, the first thing you need to do (obviously) is follow the [contributing](https://github.com/kevintuhumury/kuva#contributing) rules.

The next thing is setting up your development environment. To do that, you'll need an API key and shared secret. When you've got them, you can use them in the `.env` file. If you don't have one yet, start with the following:

	mv .env.example .env

Now fill in the Flickr variables in the `.env` file. This file will be used by RSpec (more specifically the `spec_helper.rb` file) to make the Flickr API calls by setting the values as environment variables.

## Customization

If you're like me, you'll want to adjust the default (basic) functionality (or at least the views). Good news, you can do that!

### Adjusting the i18n labels

The `kuva:install` generator (which you should've run by now) also installed a locale (called `config/locales/en/kuva.yml`) which contains the labels for the Kuva views. When you would like to adjust them, you now know where to look.

### Adjusting the default views

Whenever you would like to adjust the default Kuva views, you can. Simply run the following command on the command line:

	rails generate kuva:views

This will copy all the default views to your application. They'll be placed in the `app/views/kuva` directory. Once that's done, you can edit them to your liking.

## Example usage of Kuva

If you would like to see the Kuva Rails engine in action, you can checkout the following website: [NewMediaFreak](http://www.newmediafreak.nl/fotografie). I've (it's my personal website) adjusted the views a bit though.

## Contributing

You're very welcome to contribute to this gem. To do so, please follow these steps:

1. Fork this project
2. Clone your fork on your local machine
3. Install the development dependencies with `bundle install`
4. Follow [the above steps](https://github.com/kevintuhumury/kuva#step-1-apply-for-an-api-key-and-shared-secret) to request your own API key and shared secret
5. Follow [the above steps](https://github.com/kevintuhumury/kuva#step-2-filling-in-kuvas-configuration-options) to configure the Kuva Rails engine
6. Follow [the above steps](https://github.com/kevintuhumury/kuva#configuring-your-development-environment) to configure your development environment
7. Create your feature branch with `git checkout -b my-new-feature`
8. Run the specs with `rspec` and make sure everything is covered with RSpec
9. Commit your changes `git commit -am 'Added new feature'`
10. Push to your branch `git push origin my-new-feature`
11. Create a new Pull Request

## Wishlist

Kuva has some basic functionality, but it can always be improved. Some features that might be useful:

- Pagination (e.g. kaminari) on the photoset collection and photoset view (when you've got a lot of photosets or photos)
- Navigating through the photosets and photos (going to the next one)
- Adding a photostream
- Adding exif data to the photo view
- Adding geo data to the photo view
- Adding tags (including filtering by those tags)
- Adding comments (or simply showing them)

When you would like to contribute, but you're not sure what to add, pick something from the list above. If you start on one of them, please [add a new issue](https://github.com/kevintuhumury/kuva/issues/new) (to claim a feature), so that we don't get multiple pull requests for the same functionality.

## Copyright

Copyright 2014 Kevin Tuhumury. Released under the MIT License.
