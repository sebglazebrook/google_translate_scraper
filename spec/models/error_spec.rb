require 'spec_helper'

describe GoogleTranslateScraper::Models::Error do

  describe "attributes" do

    it "has a message" do
      subject.respond_to?(:message).should == true
    end
  end

  describe "initialize" do

    let(:arguments) { {:message => "You didn't provide a source language my man!"} }

    it "sets all instance variables given" do

      translation = subject.class.new(arguments)
      arguments.keys.each do |key|
        translation.send(key).should == arguments[key]
      end
    end
  end

end