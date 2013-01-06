module GoogleTranslateScraper
  module Models

    class Response

      attr_accessor :errors, :translations

      def initialize
        @errors = []
        @translations = []
      end
    end
  end
end