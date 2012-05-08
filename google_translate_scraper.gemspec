# -*- encoding: utf-8 -*-
require File.expand_path('../lib/google_translate_scraper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Seb Glazebrook"]
  gem.email         = ["me@sebglazebrook.com"]
  gem.description   = %q{"This gem scraps GoogleTranslate and returns the translation for the given search phrase. If multiple translations are available, multiple are returned."}
  gem.summary       = %q{"This gem scrapes Google Translate and their results."}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "google_translate_scraper"
  gem.require_paths = ["lib"]
  gem.version       = GoogleTranslateScraper::VERSION
  gem.add_dependency "nokogiri"
  gem.add_development_dependency 'rspec', '~> 2.10.0'
end
