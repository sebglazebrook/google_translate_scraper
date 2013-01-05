# encoding: utf-8
require 'spec_helper'

describe GoogleTranslateScraper do

  describe "format of response" do

    it 'is should be iterable' do
      translator = GoogleTranslateScraper::Translator.new
      results = translator.translate("en", "sv", "Hello")
      results.respond_to?(:each).should == true
    end

  end

  context "dictionary translations" do

    it 'should return an array of Swedish translations for an English word' do
      translator = GoogleTranslateScraper::Translator.new
      results = translator.translate("en", "sv", "Hello")
      results.first.should == "Hallå"
    end

  end

  context "non dictionary translations" do

    it 'should return a Swedish translations for a short English sentence' do
      translator = GoogleTranslateScraper::Translator.new
      results = translator.translate("en", "sv", "Hello there")
      results.first.should == "Hallå där"
    end

    it 'should return a Swedish translations for a long English sentence' do
      translator = GoogleTranslateScraper::Translator.new
      results = translator.translate("en","sv","Hi how are you? I'm good how are you?")
      results.first.should == "Hej hur mår du? Jag är bra hur mår du?"
    end
  end
end