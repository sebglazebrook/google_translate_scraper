require 'spec_helper'

describe GoogleTranslateScraper::Models::Translator do

  let(:arguments) {{:source_language => 'en', :target_language => 'sv', :search_text => 'hey'}}
  let(:subject) { GoogleTranslateScraper::Models::Translator.new(arguments)}

  describe "format of response" do

    it "returns a Response object" do
      response = subject.translate
      response.class.should == GoogleTranslateScraper::Models::Response
    end
  end

  describe "successful translation" do

    context "word/dictionary translation" do

      let(:arguments) {{:source_language => 'en', :target_language => 'sv', :search_text => 'cat'}}
      let(:subject) { GoogleTranslateScraper::Models::Translator.new(arguments).translate }

      it "returns a translation" do
        subject.translations.first.translated_text.should == 'katt'
      end

    end

    context "phrase/non-dictionary translation" do

      let(:arguments) {{:source_language => 'en', :target_language => 'sv', :search_text => 'the little cat'}}
      let(:subject) { GoogleTranslateScraper::Models::Translator.new(arguments).translate }

      it "returns a translation" do
        subject.translations.size.should == 1
        subject.translations.first.translated_text.should == 'den lilla katten'
      end

    end
  end

  describe "non-successful translation" do

    let(:arguments) { {:source_language => 'en', :target_language => 'sv', :search_text => 'hello my friend'} }
    let(:subject) { GoogleTranslateScraper::Models::Translator.new(arguments)}

      context "a required argument was missing" do

        it "returns an error" do
          subject.instance_variable_set("@source_language", nil)
          response = subject.translate
          response.errors.first.message.should == "Required argument missing: source_language"
        end
      end

      context "multiple arguments are missing" do

        it "returns multiple errors" do
          subject.instance_variable_set("@source_language", nil)
          subject.instance_variable_set("@target_language", nil)
          response = subject.translate
          response.errors.size.should == 2
        end
      end

      context "no translations were found" do

        it "returns an error" do
          subject.stub(:fetch_from_google)
          response = subject.translate
          response.errors.first.message.should == "No translations were found. Google might have changed their HTML"
        end
      end
  end
end