require 'spec_helper'

describe GoogleTranslateScraper::Models::Translation do

  describe "attributes" do

    %w[ source_language target_language search_text translated_text ].each do |attribute|
      it "has a #{attribute}" do
        subject.respond_to?(attribute).should == true
      end
    end
  end

  describe "initialize" do

    let(:arguments) { {:source_language => 'sv', :target_language => 'en', :search_text => 'Hej!'} }

    it "sets all instance variables given" do

      translation = subject.class.new(arguments)
      arguments.keys.each do |key|
        translation.send(key).should == arguments[key]
      end
    end
  end

end