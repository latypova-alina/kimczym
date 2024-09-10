module Words
  module Builders
    module Adjectives
      class Parser < Base
        def initialize(degree, number, gender)
          super()
          @degree = degree
          @number = number
          @gender = gender
        end

        def call
          OpenStruct.new(
            degree: OpenStruct.new(name: degree, translation: I18n.t("#{NAME}.#{degree}")),
            number: OpenStruct.new(name: number, translation: I18n.t("shared.#{number}")),
            gender: OpenStruct.new(name: gender, translation: I18n.t("shared.#{gender}")),
            key_name: [number, gender, degree].join("."),
            buttons: ButtonsParser.call(degree, number, gender)
          )
        end

        attr_reader :degree, :number, :gender
      end
    end
  end
end
