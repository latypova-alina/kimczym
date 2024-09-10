module Words
  module Builders
    module Adjectives
      class ButtonsParser < Base
        def initialize(degree, number, gender)
          super()
          @degree = degree
          @number = number
          @gender = gender
        end

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
            translation: ButtonTranslator.call(category, button_key)
          }
        end

        def button
          @button ||= BUTTONS[key_name]
        end

        def key_name
          @key_name ||= [number, BUTTON_GENDER[gender], degree].join(".")
        end

        attr_reader :degree, :number, :gender
      end
    end
  end
end
