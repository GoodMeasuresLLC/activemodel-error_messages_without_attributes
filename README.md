# ActiveModel::ErrorMessagesWithoutAttributes

Extends ActiveModel::Errors to allow messages to be generated that do not use
the attribute name.  Sometimes, you just want to use a custom error message
without jumping through a lot of rails hoops.  With this gem, you specify
an error message of '^Just use this error' and the attribute name will not be
included in full_error messages for that attribute.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activemodel-error_messages_without_attributes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activemodel-error_messages_without_attributes

## Usage

```ruby
  class User < ActiveRecord::Base
    validates :first_name,
      :presence => {:message => 'cannot be blank.'},
      :length => {:maximum => 64, :message => '^What are you thinking?'}

    validates :last_name, :presence => true
  end
```

### Error messages work the same as the defaults

```ruby
  user_without_name = User.new
  user_without_name.valid?

  user_without_name.errors.full_messages_for(:first_name)
  # ["First name cannot be blank."]

  user_without_name.errors.full_messages_for(:first_name)
  # ["Last name can't be blank"]
```

### Error messages starting with ^ do not include the attribute

```
  user_with_too_long_a_name = User.new('a'*65)
  user_with_too_long_a_name.valid?

  user_with_too_long_a_name.full_messages_for(:first_name)
  # ["What are you thinking?"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/activemodel-error_messages_without_attributes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveModel::ErrorMessagesWithoutAttributes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/activemodel-error_messages_without_attributes/blob/master/CODE_OF_CONDUCT.md).
