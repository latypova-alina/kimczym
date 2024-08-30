module Words
  module Builders
    module Adjectives
      class ButtonTranslator < Base

        def initialize(category, button_key)
          @category = category
          @button_key = button_key
        end

        def call
          I18n.t([NAME, "buttons", category, button_key_match(category, button_key)].join("."))
        end

        private

        def button_key_match(category, key_name)
          key_name.match(/#{BUTTON_KEYS_MATCHERS[category]}/).to_s
        end

        attr_reader :category, :button_key
      end
    end
  end
end
