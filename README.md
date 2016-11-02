# Memoized Inflectors Rails

This is the official Rails wrapper for the [memoized_inflectors gem](https://github.com/WizardOfOgz/memoized_inflectors).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'memoized_inflectors_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install memoized_inflectors_rails

## Usage

See the [Memoized Inflectors README](https://github.com/WizardOfOgz/memoized_inflectors/blob/master/README.md) for usage, configuration and documentation specific to that gem.

Memoized values of some methods (`constantize` and `safe_constantize`) become stale when the Rails environment reloads. Such reloading happens by default when the application is running in development mode and code is modified. Memoized Inflectors Rails registers a to_prepare block which runs each time the Rails environment is reloaded and clears the sensitive caches.

### Configuration

It is possible to configure which caches are cleared when the application is reloaded by adding a line like the following to your `application.rb` file or to an environment file. It is recommended that you always include `constantize` and `safe_constantize`.

```ruby
Rails.application.config.memoized_inflectors_reload_caches = %i[constantize safe_constantize classify]
```

## TODOs

* Add builds for multiple ruby versions and platforms.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/WizardOfOgz/memoized_inflectors_rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
