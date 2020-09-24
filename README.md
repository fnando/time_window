# TimeWindow

[![Travis-CI](https://travis-ci.org/fnando/time_window.svg)](https://travis-ci.org/fnando/time_window)
[![CodeClimate](https://codeclimate.com/github/fnando/time_window.svg)](https://codeclimate.com/github/fnando/time_window)
[![Test Coverage](https://codeclimate.com/github/fnando/time_window/badges/coverage.svg)](https://codeclimate.com/github/fnando/time_window/coverage)
[![Gem](https://img.shields.io/gem/v/time_window.svg)](https://rubygems.org/gems/time_window)
[![Gem](https://img.shields.io/gem/dt/time_window.svg)](https://rubygems.org/gems/time_window)

Retrieve time objects by time windows (e.g. TimeWindow.call('5m') will round
minutes to multiples of 5).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time_window'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time_window

## Usage

You can get a time window for any given time object. By default, it uses
`Time.now`.

```ruby
require "time_window"

Time.now
#=> 2018-12-10 07:07:14 -0800

TimeWindow.call("5m")
#=> 2018-12-10 07:05:00 -0800
```

You can use the following units as time windows:

- `s`: second
- `m`: minute
- `h`: hour

To specify a custom time object, just pass a second argument.

```ruby
TimeWindow.call "15m", Time.parse("2032-11-23T14:55:26")
#=> 2032-11-23 14:45:00 -0800
```

By default, `Time.now` is used as the default time. You can override the
generator by setting `TimeWindow.now_proc`.

```ruby
# https://api.rubyonrails.org/classes/Time.html#method-c-current
TimeWindow.now_proc = -> { Time.current }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/fnando/time_window. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TimeWindow project’s codebases, issue trackers, chat
rooms and mailing lists is expected to follow the
[code of conduct](https://github.com/fnando/time_window/blob/main/CODE_OF_CONDUCT.md).
