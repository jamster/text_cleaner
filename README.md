# TextCleaner

Simple gem does one thing, and one thing only... Turns funky chars such as `‘‘“”` into the proper HTML Encodings such as `&lsquo;&lsquo;&ldquo;&rdquo;`.

## Installation

Add this line to your application's Gemfile:

    gem 'text_cleaner'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install text_cleaner

## Usage

    TextCleaner.clean(input_text)
    TextCleaner.only(input_text, char)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
