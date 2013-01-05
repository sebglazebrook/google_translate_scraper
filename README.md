# GoogleTranslateScraper

This gem scraps GoogleTranslate and returns the translation for the given search phrase.

If multiple translations are available, multiple are returned.

## Installation

Add this line to your application's Gemfile:

    gem 'google_translate_scraper'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google_translate_scraper

## Usage

1- require 'google_translate_scraper'

2- translator = GoogleTranslateScraper::Translator.new

3- translations = translator.translate( source_language  = "en", target_language = "sv", search_phrase = "sup fool" ) 

NOTE: source and target language values must be a string containg the ISO 639-1 letter code for that language. For a list see here: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
