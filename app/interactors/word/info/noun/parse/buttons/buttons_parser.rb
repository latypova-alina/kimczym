module Word
  module Info
    module Noun
      module Parse
        module Buttons
          class ButtonsParser < Word::Info::Noun::Base
            delegate :item, to: :context
            delegate :key_name, :number, to: :item

            def call
              context.buttons = OpenStruct.new(
                number: parsed_buttons("number"),
                key_name: number,
                categories: BUTTONS_CATEGORIES
              )
            end

            private

            def parsed_buttons(category)
              CategoryButtonsParser.call(key_name: number, category:).parsed_buttons
            end
          end
        end
      end
    end
  end
end
