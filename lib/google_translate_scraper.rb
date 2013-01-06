require "google_translate_scraper/version"
require "google_translate_scraper/models/translator"
require "google_translate_scraper/models/error"
require "google_translate_scraper/models/translation"
require "google_translate_scraper/models/response"

module GoogleTranslateScraper

  def self.translate args
    Models::Translator.new(args).translate
  end
end
