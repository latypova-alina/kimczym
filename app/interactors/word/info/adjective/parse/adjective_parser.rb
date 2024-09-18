module Word
  module Info
    module Adjective
      module Parse
        class AdjectiveParser < Word::Info::Adjective::Base
          delegate :degree, :number, :gender, :processed_items, to: :context

          def call
            processed_items << OpenStruct.new(
              degree: degree_object,
              number: number_object,
              gender: gender_object,
              key_name:,
              buttons: 
            )
          end

          private

          def degree_object
            OpenStruct.new(name: degree, translation: I18n.t("#{NAME}.#{degree}"))
          end

          def number_object
            OpenStruct.new(name: number, translation: I18n.t("shared.#{number}"))
          end

          def gender_object
            OpenStruct.new(name: gender, translation: I18n.t("shared.#{gender}"))
          end

          def key_name
            [number, gender, degree].join(".")
          end

          def buttons
            Buttons::ButtonsParser.call(degree:, number:, gender:).buttons
          end
        end
      end
    end
  end
end
