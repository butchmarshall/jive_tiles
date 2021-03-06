[![Gem Version](https://badge.fury.io/rb/jive_tiles.svg)](http://badge.fury.io/rb/jive_tiles)
[![Build Status](https://travis-ci.org/butchmarshall/jive_tiles.svg?branch=master)](https://travis-ci.org/butchmarshall/jive_tiles)

# JiveTiles

JiveTiles is a mountable engine for Rails that enables [Jive](https://www.jivesoftware.com) [Tile](https://community.jivesoftware.com/docs/DOC-124346) functionality.

Release Notes
============

**0.0.6**
 - Compatability fixes with gem dependencies

**0.0.1**
 - Dummy app now registers/unregisters tiles with [Jive Sandbox](https://sandbox.jiveon.com)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jive_tiles'
```

And then execute:

    $ bundle

## Usage

In your routes.rb file, mount the rails engine to enable add-on support.

```ruby
Rails.application.routes.draw do
	mount JiveTiles::Engine => "/special_path_for_api"
end
```

See /spec/dummy/extension_src for the example add-on extension that is uploaded.  You'll need to change the endpoints!

For whitelisting and blacklisting specific

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/butchmarshall/jive_tiles.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).