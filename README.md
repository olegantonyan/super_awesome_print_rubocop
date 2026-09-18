# SuperAwesomePrintRubocop

[![CI](https://github.com/olegantonyan/super_awesome_print_rubocop/actions/workflows/ci.yml/badge.svg)](https://github.com/olegantonyan/super_awesome_print_rubocop/actions/workflows/ci.yml)

A [RuboCop](https://rubocop.org) cop that flags leftover `sap` and `sapf` debug calls from [super_awesome_print](https://github.com/olegantonyan/super_awesome_print), so they don't reach production.

Requires Ruby 2.7+ and RuboCop 1.0+.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'super_awesome_print_rubocop', require: false
```

And then run:

    $ bundle install

Or install it yourself:

    $ gem install super_awesome_print_rubocop

Enable it in `.rubocop.yml`. On RuboCop 1.72 or newer:

```yaml
plugins:
  - super_awesome_print_rubocop
```

On older RuboCop:

```yaml
require:
  - super_awesome_print_rubocop
```

## Usage

Run `rubocop` as usual. It reports every `sap` or `sapf` call, including `self.sap`:

```
app/controllers/posts_controller.rb:3:3: C: SuperAwesomePrint/Avoid: Avoid sap in production.
  sap @posts
  ^^^^^^^^^^
```

## Development

After checking out the repo, run `bin/setup` to install dependencies, then `bundle exec rake test` to run the tests. Run `bin/console` for an interactive prompt.

To test against a specific RuboCop version, set `RUBOCOP_VERSION` to a version requirement. Older RuboCop versions may need an older Ruby (CI runs RuboCop 1.0 on Ruby 2.7):

    $ RUBOCOP_VERSION='~> 1.71.0' bundle update rubocop
    $ RUBOCOP_VERSION='~> 1.71.0' bundle exec rake test

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, then run `bundle exec rake release`. This creates a git tag for the version, pushes git commits and tags, and pushes the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olegantonyan/super_awesome_print_rubocop. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SuperAwesomePrintRubocop project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/olegantonyan/super_awesome_print_rubocop/blob/master/CODE_OF_CONDUCT.md).
