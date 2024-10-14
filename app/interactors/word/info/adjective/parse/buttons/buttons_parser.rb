module Word
  module Info
    module Adjective
      module Parse
        module Buttons
          class ButtonsParser < Word::Info::Adjective::Base
            delegate :item, to: :context
            delegate :key_name, to: :item

            def call
              context.buttons = OpenStruct.new(
                number: parsed_buttons("number"),
                gender: parsed_buttons("gender"),
                degree: parsed_buttons("degree"),
                key_name:,
                categories: BUTTONS_CATEGORIES
              )
            end

            private

            def parsed_buttons(category)
              CategoryButtonsParser.call(key_name:, category:).parsed_buttons
            end
          end
        end
      end
    end
  end
end
