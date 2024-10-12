module Word
  module Info
    module Noun
      module Parse
        class NounParser < Word::Info::Noun::Base
          delegate :number, :processed_items, to: :context

          def call
            processed_items << OpenStruct.new(
              number: number_object,
              key_name: number,
              buttons:
            )
          end

          private

          def number_object
            OpenStruct.new(name: number, translation: I18n.t("shared.#{number}"))
          end

          def buttons
            Buttons::ButtonsParser.call(number:).buttons
          end
        end
      end
    end
  end
end
