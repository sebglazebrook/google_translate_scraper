module GoogleTranslateScraper
  module Models

    class Translation

      attr_accessor :source_language, :target_language, :search_text, :translated_text

      def initialize(arguments = {})
        arguments.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end
    end
  end
end