module Word
  module Info
    module Noun
      module Parse
        module Buttons
          class ButtonsParser < Word::Info::Noun::Base
            delegate :number, :gender, :degree, to: :context

            def call
              context.buttons = OpenStruct.new(
                number: parsed_buttons("number"),
                key_name:,
                categories: BUTTONS_CATEGORIES
              )
            end

            private

            def key_name
              number
            end

            def parsed_buttons(category)
              CategoryButtonsParser.call(key_name:, category:).parsed_buttons
            end
          end
        end
      end
    end
  end
end
