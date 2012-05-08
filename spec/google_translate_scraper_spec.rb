require 'spec_helper'

describe GoogleTranslateScraper do
  it 'should return an array' do
     translator = GoogleTranslateScraper::Translator.new
     results = translator.translate("en", "sv", "Hello")
     results.should be_a_kind_of Array
  end
  
  # dictionary translations
  it 'should return an array of Swedish translations for an English word' do
     translator = GoogleTranslateScraper::Translator.new
     results = translator.translate("en", "sv", "Hello")
     results.size.should > 1
  end
  
  # non-dictinary translations
  it 'should return a Swedish translations for a short English sentence' do
     translator = GoogleTranslateScraper::Translator.new
     results = translator.translate("en", "sv", "Hello there")
     results.size.should eql 1
     results[0].should eql"Hallå där"
  end
  
  it 'should return a Swedish translations for a long English sentence' do
    translator = GoogleTranslateScraper::Translator.new
    results = translator.translate("en","sv","Hi how are you? I'm good how are you?")
    results.size.should eql 1
    results[0].should eql"Hej hur mår du? Jag är bra hur mår du?"
  end
end