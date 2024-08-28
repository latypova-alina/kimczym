module Words
  module Builders
    module Adjectives
      class Formatter < Base

        def initialize(items)
          super(items)
          @result = items
        end

        private

        def build_result
          result.each do |button_key, info|
            result[button_key]["formatted_text"] ||= ""

            info["text"].each do |degree, numbers|
              result[button_key]["formatted_text"] << "\n<strong>#{degree}</strong>\n" unless numbers.blank?
              
              numbers.each do |number, genders|
                result[button_key]["formatted_text"] << "\n<strong>#{number}</strong>\n" unless genders.blank?
              
                genders.each do |gender, grammatical_cases|
                  result[button_key]["formatted_text"] << "\n<strong>#{gender}</strong>\n\n" unless grammatical_cases.blank?
              
                  grammatical_cases.each do |grammatical_case, word|
                    result[button_key]["formatted_text"] << "<strong>#{grammatical_case}</strong> #{word}\n"
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end
