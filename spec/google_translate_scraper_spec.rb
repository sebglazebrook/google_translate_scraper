require 'spec_helper'

describe GoogleTranslateScraper do

  it "scrapes and translates google translate" do
    response = subject.translate(:source_language => 'en', :target_language => 'sv', :search_text => 'hey')
    response.translations.first.translated_text.should == 'hej'
  end
end