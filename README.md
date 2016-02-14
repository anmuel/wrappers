# Wrappers

A PoC to create own wrapper classes for plain ruby datatypes such as Boolean and
Integers. The goal is to make life easier when working with wrapped data such as
Boolean covered in Strings.
Additionally metadata should be provided to cover questions like "was the input
valid?"

Datatypes available are:

* Integer
* Boolean
* Cidr

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wrappers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wrappers

## Usage

Just call any datatype provided via the shorthand method like
```ruby
Wrappers::Integer('1') #=> 1
```

or make the explicit convert call

```ruby
Wrappers::Integer.try_convert('1') #=> 1
```

or create a new instance manually and have access to metadata

```ruby
integer = Wrappers::Integer.new('1')
integer.original_value #=> '1'
integer.value #=> 1
integer.valid? #=> true
```

Since the classes derive from SimpleDelegator you may use them as the
 traditional datatypes they are as in
 
 ```ruby
 Wrappers::Integer('1') + 1 #=> 2
 ```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wrappers.
