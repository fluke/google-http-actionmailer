# GoogleHttpActionmailer

An ActionMailer adapter to send email using Google's HTTPS Web API (instead of SMTP).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google-http-actionmailer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google-http-actionmailer

## Usage

Set up your `authorization` as described in the [Google API Client](https://github.com/google/google-api-ruby-client/#authorization) (the easiest method is to pass a valid access token), edit `config/application.rb` or `config/environments/$ENVIRONMENT.rb` and add/change the following to the ActionMailer configuration:

```ruby
config.action_mailer.delivery_method = :google_http_actionmailer
config.action_mailer.google_http_actionmailer_settings = {
  authorization: ...,
  client_options: {
    application_name: ...,
    application_version: ...,
  },
  request_options: {
    retries: ...,
    header: ...,
  },
  message_options: {
    fields: ...,
    content_type: ...,
  }
}
```

For client and request options, you can look [here](https://github.com/google/google-api-ruby-client/blob/master/lib/google/apis/options.rb). And for message options, you can look at the `send_user_message` method [here](https://github.com/google/google-api-ruby-client/blob/master/generated/google/apis/gmail_v1/service.rb#L1150).

For dynamic setting of delivery method (this may be required given the access tokens usually expire):

```ruby
mail.delivery_method(
  GoogleHttpActionmailer::DeliveryMethod, {
  authorization: ...
})
```

Normal ActionMailer usage will now transparently be sent using Google's HTTPS API.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/google_http_actionmailer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GoogleHttpActionmailer project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/google_http_actionmailer/blob/master/CODE_OF_CONDUCT.md).
