module GoogleTranslateScraper
  class Translator
    @@input_language
    @@target_language
    @@text
    
    def translate(input_language, target_language, text )
      @@input_language = input_language
      @@target_language = target_language
      @@text = text
      get_translation
    end
  
   
    
  end
end