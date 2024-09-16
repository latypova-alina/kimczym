module Word
  module Info
    module Adjective
      module Parse
        module Buttons
          class ButtonsParser < Word::Info::Adjective::Base
            delegate :number, :gender, :degree, to: :context

            def call
              OpenStruct.new(
                number: button["number"].map { |button_key| OpenStruct.new(parse_button("number", button_key)) },
                gender: button["gender"].map { |button_key| OpenStruct.new(parse_button("gender", button_key)) },
                degree: button["degree"].map { |button_key| OpenStruct.new(parse_button("degree", button_key)) },
                key_name:,
                categories: BUTTONS_CATEGORIES
              )
            end

            private

            def parse_button(category, button_key)
              {
                key_name: button_key,
                translation: Translator.call(category:, key_name:)
              }
            end

            def button
              @button ||= BUTTONS[key_name]
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
