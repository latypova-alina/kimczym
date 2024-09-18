module Word
  module Info
    module Adjective
      module Parse
        module Buttons
          class ButtonsParser < Word::Info::Adjective::Base
            delegate :number, :gender, :degree, to: :context

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

            def key_name
              @key_name ||= [number, BUTTON_GENDER[gender], degree].join(".")
            end
          end
        end
      end
    end
  end
end
