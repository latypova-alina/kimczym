module Word
  module Info
    module Adjective
      module Parse
        module Buttons
          class Translator < Word::Info::Adjective::Base
            delegate :category, :key_name, to: :context

            def call
              context.text = I18n.t([NAME, "buttons", category, button_key_match].join("."))
            end

            private

            def button_key_match
              key_name.match(/#{BUTTON_KEYS_MATCHERS[category]}/).to_s
            end
          end
        end
      end
    end
  end
end
