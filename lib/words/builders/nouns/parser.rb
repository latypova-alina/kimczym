module Words
  module Builders
    module Nouns
      class Parser < Base

        private

        def build_result
          items.each do |item|
            form_parts = item["form"].split(":")
            word = item["word"]
            
            part_of_speech = form_parts[0].to_sym
            number = form_parts[1].to_sym
            cases = form_parts[2].split(".").map(&:to_sym)

            cases.each do |grammatical_case|
              result[part_of_speech] ||= {}
              result[part_of_speech][number] ||= {}
              result[part_of_speech][number][grammatical_case] = word
            end
          end
        end
      end
    end
  end
end
