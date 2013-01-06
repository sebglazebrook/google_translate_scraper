require 'spec_helper'

describe GoogleTranslateScraper::Models::Response do

  describe "errors" do

    before do
      subject.errors << GoogleTranslateScraper::Models::Error.new(:message => "You did something wrong!")
    end

    it "is iterable" do
      subject.errors.respond_to?(:each).should == true
    end

    it "is a list of error objects" do
      subject.errors.first.class.should == GoogleTranslateScraper::Models::Error
    end
  end

  describe "translations" do

    before do
      subject.translations << GoogleTranslateScraper::Models::Translation.new(:source_language => 'sv', :target_language => 'en', :search_text => 'Hej', :translated_text => 'Hey')
    end

    it "is iterable" do
      subject.translations.respond_to?(:each).should == true
    end

    it "is a list of translation objects" do
      subject.translations.first.class.should == GoogleTranslateScraper::Models::Translation
    end

  end

end