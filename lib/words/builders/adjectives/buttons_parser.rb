module Words
  module Builders
    module Adjectives
      class ButtonsParser < Base

        def initialize(degree, number, gender)
          @degree = degree
          @number = number
          @gender = gender
        end

        def call
          button_gender = BUTTON_GENDER[gender]
          key_name = [number, button_gender, degree].join(".")
          button = BUTTONS[key_name]
          OpenStruct.new(
            number: button["number"].map{|button_key| OpenStruct.new(parse_button("number", button_key)) },
            gender: button["gender"].map{|button_key| OpenStruct.new(parse_button("gender", button_key)) },
            degree: button["degree"].map{|button_key| OpenStruct.new(parse_button("degree", button_key)) },
            key_name: key_name #must be level up
          )
        end

        private

        def parse_button(category, button_key)
          stripped_button = button_key.split(".")
          { 
            number: stripped_button[0],
            gender: stripped_button[1],
            degree: stripped_button[2],
            translation: ButtonTranslator.call(category, button_key),
            key_name: button_key
          }
        end

        attr_reader :degree, :number, :gender
      end
    end
  end
end
