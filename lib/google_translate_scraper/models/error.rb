module GoogleTranslateScraper
  module Models

    class Error

      attr_accessor :message

      def initialize(arguments = {})
        arguments.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

    end

  end
end