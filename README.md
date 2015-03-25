# Contracts::Noop

Allows usage of [contracts.ruby](https://github.com/egonSchiele/contracts.ruby) in gems/libraries only as a development dependency.

This gem needs to be a runtime dependency though.

When it is impossible to load `contracts`, this gem will load its own `Contracts` which will be noop.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'contracts-noop'
```

Or add it to your `my-gem.gemspec`:

```ruby
spec.add_runtime_dependency 'contracts-noop'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install contracts-noop

## Usage

```ruby
require 'contracts/noop'

Contracts::Noop.when_contracts_available do
  # .. assume contracts were loaded here ..
  # .. ie: load custom contracts, other contract plugins, configure
  # failure_callback, etc. ..
end
```

## Contributing

1. Fork it ( https://github.com/waterlink/contracts-noop/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
