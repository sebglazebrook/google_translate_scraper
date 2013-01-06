module GoogleTranslateScraper
  module Models
    require 'net/http'
    require 'nokogiri'

    class Translator

      attr_accessor :source_language, :target_language, :search_text, :response

      def initialize(arguments)
        arguments.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
        @response = Response.new
      end

      def translate
        if valid?
          populate_translations
        end
        response
      end

      def required_variables
        %w[source_language target_language search_text]
      end

      private

      def valid?
        validate_required_variables
      end

      def validate_required_variables
        required_variables.each do |required_instance_variable|
          add_error("Required argument missing: #{required_instance_variable}") unless instance_variable_get "@#{required_instance_variable}"
        end
        response.errors.size > 0 ? false : true
      end

      def populate_translations
        fetch_from_google
        add_error("No translations were found. Google might have changed their HTML") unless @response.translations.size > 0
      end

      def page
        # set POST variables
        js = "n"
        prev = "_t"
        hv = "en"
        ie = "UTF-8"
        layout = "2"
        eotf = "1"
        file = ""

        http_response =  Net::HTTP.post_form(URI.parse('http://translate.google.com/'), {:sl => source_language, :tl => target_language, :js => js, :prev => prev, hv => hv, :ie =>
            ie , :layout => layout, :eotf => eotf, :text => search_text, :file => file})
        html_string = http_response.body
        Nokogiri::HTML(html_string)
      end

      def fetch_from_google
        translation = get_dictionary_translation(page)
        add_translation(get_non_dictionary_translation(page).text) if response.translations.size == 0
      end

      # when there are multiple translations
      def get_dictionary_translation html_doc
        translations = Array.new
        translation = html_doc.xpath("//span[@id='result_box']")
        translation.each do |t|
          add_translation t.text
        end
        translations
      end

      # when there is a phrase with no dictionary translation i.e multiple possible translations
      def get_non_dictionary_translation html_doc
        html_doc.xpath('//*[@id="result_box"]/span')
      end

      def add_translation translated_text
        response.translations << Translation.new(
            :source_language => @source_language,
            :target_language => @target_language,
            :search_text => @search_text,
            :translated_text => translated_text
        )
      end

      def add_error error_message
        response.errors << Error.new(:message => error_message)
      end
    end
  end
end