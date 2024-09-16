module Word
  module Info
    module Adjective
      module Parse
        class AdjectiveParser < Word::Info::Adjective::Base
          delegate :degree, :number, :gender, :processed_items, to: :context

          def call
            processed_items << OpenStruct.new(
              degree: OpenStruct.new(name: degree, translation: I18n.t("#{NAME}.#{degree}")),
              number: OpenStruct.new(name: number, translation: I18n.t("shared.#{number}")),
              gender: OpenStruct.new(name: gender, translation: I18n.t("shared.#{gender}")),
              key_name: [number, gender, degree].join("."),
              buttons: Buttons::ButtonsParser.call(degree:, number:, gender:)
            )
          end
        end
      end
    end
  end
end
