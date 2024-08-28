module Words
  module Builders
    module Adjectives
      class ButtonsParser < Base

        BUTTON_KEYS_MATCHERS = {
          "number" => "pl|sg",
          "gender" => "m1|m2|m3|f|n",
          "degree" => "pos|com|sup"
        }.freeze

        MAIN_KEY_NAME = "buttons".freeze

        private

        def build_result
          BUTTONS.each do |button_key, info|
            info.each do |category, values|
              result[button_key] ||= {}
              result[button_key][MAIN_KEY_NAME] ||= {}
              result[button_key][MAIN_KEY_NAME][category] ||= []
              
              values.each do |key_name|
                result[button_key][MAIN_KEY_NAME][category] << {
                  key_name: key_name,
                  translation: translated_button(category, key_name)
                }
              end
            end
          end
        end

        def translated_button(category, key_name)
          I18n.t([NAME, MAIN_KEY_NAME, category, button_key_match(category, key_name)].join("."))
        end

        def button_key_match(category, key_name)
          key_name.match(/#{BUTTON_KEYS_MATCHERS[category]}/).to_s
        end
      end
    end
  end
end
