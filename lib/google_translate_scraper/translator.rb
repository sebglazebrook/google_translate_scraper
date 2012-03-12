module GoogleTranslateScraper
require 'net/http'  
require 'nokogiri'
    
  class Translator
    
    @@input_language = nil
    @@target_language = nil
    @@text = nil
    
    def translate(input_language, target_language, text )
      @@input_language = input_language
      @@target_language = target_language
      @@text = text
      get_translation
    end
    
    def get_translation
      # set POST variables
      js = "n"
      prev = "_t"
      hv = "en"   # i think this is the language of the website
      ie = "UTF-8"
      layout = "2"
      eotf = "1"
      file = ""

      # download the webpage
      http_response =  Net::HTTP.post_form(URI.parse('http://translate.google.com/'), {"sl" => @@input_language, "tl" => @@target_language, "js" => "n", "prev" => "_t", "hv" => "en", "ie" =>
        "UTF-8" , "layout" => "2", "eotf" => "1", "text" => @@text, "file" => ""})
      # get the string
      html_string = http_response.body
      # convert string to a Nokogiri document file
      html_doc = Nokogiri::HTML(html_string)
      # find the translation
      translation = Array.new
      translation = get_dictionary_translation(html_doc)
      # check for non-dictionary translations
      if translation.empty?
        translation[0] = get_non_dictionary_translation(html_doc).text
      end
      return translation
      
    end  
    
    # when there are multiple translations
    def get_dictionary_translation html_doc
      translations = Array.new
      translation = html_doc.xpath('//div[@id="gt-res-dict"]/ol/li/div/div')
      translation.each do |t|
        translations.push t.text
      end
      translations
    end
  
    # when there is a phrase with no dictionary translation i.e multiple possible translations
    def get_non_dictionary_translation html_doc
      translation = html_doc.xpath('//html/body/div[2]/div[2]/form/div[2]/div[2]/div/div/div[2]/div/div[2]/span/span')                                  
    end
    
  end
end