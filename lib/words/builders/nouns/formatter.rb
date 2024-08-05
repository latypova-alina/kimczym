module Words
  module Builders
    module Nouns
      class Formatter < Base
        private

        def build_result
          result["word_forms"] = ""

          items.each do |number_key, value|
            result["word_forms"] << "\n<strong>#{number_key}</strong>\n\n"
            value.each do |grammatical_case, word|
              result["word_forms"] << "<strong>#{grammatical_case}</strong> #{word}\n"
            end
          end
        end
      end
    end
  end
end
