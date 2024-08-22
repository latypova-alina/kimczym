module Words
  module Builders
    module Nouns
      class Translator < Base
        private

        def build_result
          items[NAME].each do |number, cases|
            number_translation = I18n.t("shared.#{number}")
            result[number_translation] ||= {}

            cases.each do |grammatical_case, word|
              case_translation = I18n.t("#{NAME}.#{grammatical_case}")
              result[number_translation][case_translation] = word
            end
          end
        end
      end
    end
  end
end
