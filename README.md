# Forex Rates

Built upon https://exchangeratesapi.io/ , this gem allows to fetch latest and historical foreign exchange rates. The gem comes with an optional in-built caching support so that responses can be cached (and we don't end up spamming the source).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'forex_rates'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install forex_rates

## Usage
Require the lib
```ruby
  require "forex_rates"
```

To instantiate without caching, do the following:

```ruby
forex = ForexRates::Forex.new
```
To use the built-in cache, which is built on top of faraday-http-cache, you can do following:

```ruby
forex = ForexRates::Forex.new store: store # Only store
# or
forex = ForexRates::Forex.new store: store, serializer: Marshal, logger: logger  #pass either of store, serializer and/or logger params as you would do in faraday-http-cache
```
For more details around parameters, checkout https://github.com/sourcelevel/faraday-http-cache.

You can perform following queries:

```ruby
 forex.get_latest
 # or
 forex.get_latest base: "USD", symbols: "INR,CAD"

 forex.get_for_a_day "2020-03-01"
 # or
 forex.get_for_a_day "2020-03-01", base: "USD", symbols: "INR,CAD"

 forex.get_historical "2020-01-01", "2020-07-10"
 # or
 forex.get_historical "2020-01-01", "2020-07-10", base: "USD", symbols: "INR,CAD"

```
For more details regarding parameters, head over to https://exchangeratesapi.io/



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/forex_rates. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ForexRates project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/parthoghosh24/forex_rates/blob/master/CODE_OF_CONDUCT.md).
