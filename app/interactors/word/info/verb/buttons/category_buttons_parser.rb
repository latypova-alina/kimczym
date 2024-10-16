module Word
  module Info
    module Verb
      module Buttons
        class CategoryButtonsParser < Word::Info::Verb::Base
          delegate :key_name, :category, to: :context

          def call
            context.parsed_buttons = parse_category_buttons
          end

          private

          def parse_category_buttons
            button[category].map { |button_key| OpenStruct.new(parse_button(category, button_key)) }
          end

          def parse_button(category, button_key)
            {
              key_name: button_key,
              translation: Translator.call(category:, key_name: button_key).text
            }
          end

          def button
            BUTTONS[key_name]
          end
        end
      end
    end
  end
end
