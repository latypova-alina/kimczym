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

        BUTTON_GENDER = {
          "m1" => "m1",
          "m2" => "m1",
          "m3" => "m1",
          "f" => "f",
          "n" => "n"
        }

        def initialize(items, buttons)
          @items = items
          @result = buttons
        end

        private

        def build_result
          items.each do |degree, numbers|
            degree_translation = I18n.t("#{NAME}.#{degree}")

            numbers.each do |number, genders|
              number_translation = I18n.t("shared.#{number}")

              genders.each do |gender, grammatical_cases|
                gender_translation = I18n.t("shared.#{gender}")

                grammatical_cases.each do |grammatical_case, word|
                  case_translation = I18n.t("#{NAME}.#{number}.#{GENDER_KEYS[number][gender]}.#{grammatical_case}")
                  key_for_button = button_key(degree, number, gender)

                  result[key_for_button]["text"] ||= {}
                  result[key_for_button]["text"][degree_translation] ||= {}
                  result[key_for_button]["text"][degree_translation][number_translation] ||= {}
                  result[key_for_button]["text"][degree_translation][number_translation][gender_translation] ||= {}
                  result[key_for_button]["text"][degree_translation][number_translation][gender_translation][case_translation] = word 
                end
              end
            end
          end
        end

        def button_key(degree, number, gender)
          "#{number}.#{BUTTON_GENDER[gender]}.#{degree}"
        end
      end
    end
  end
end
