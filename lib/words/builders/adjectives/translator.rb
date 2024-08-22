module Words
  module Builders
    module Adjectives
      class Translator < Base
        GENDER_KEYS = {
          "sg" => {
            "m1" => "m1_m2_m3",
            "m2" => "m1_m2_m3",
            "m3" => "m1_m2_m3",
            "f" => "f",
            "n" => "n"
          },
          "pl" => {
            "m1" => "m1",
            "m2" => "m2_m3_f_n",
            "m3" => "m2_m3_f_n",
            "f" => "m2_m3_f_n",
            "n" => "m2_m3_f_n"
          }
        }.freeze

        private

        def build_result
          items[NAME].each do |degree, numbers|
            degree_translation = I18n.t("#{NAME}.#{degree}")
            result[degree_translation] ||= {}

            numbers.each do |number, genders|
              number_translation = I18n.t("shared.#{number}")
              result[degree_translation][number_translation] ||= {}

              genders.each do |gender, grammatical_cases|
                gender_translation = I18n.t("shared.#{gender}")
                result[degree_translation][number_translation][gender_translation] ||= {}

                grammatical_cases.each do |grammatical_case, word|
                  case_translation = I18n.t("#{NAME}.#{number}.#{GENDER_KEYS[number][gender]}.#{grammatical_case}")
                  result[degree_translation][number_translation][gender_translation][case_translation] = word
                end
              end
            end
          end
        end
      end
    end
  end
end
