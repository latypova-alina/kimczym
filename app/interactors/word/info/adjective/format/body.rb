module Word
  module Info
    module Adjective
      module Format
        class Body < Word::Info::Adjective::Base
          delegate :item, to: :context

          def call
            context.body = body
          end

          private

          def body
            CLASSIC_CASES_ORDER.map do |grammatical_case|
              grammatical_case_value = item.send(grammatical_case)

              "<strong>#{I18n.t("#{translation_key}.#{grammatical_case}")}</strong> #{grammatical_case_value}"
            end.join("\n")
          end

          def translation_key
            "#{NAME}.#{item.number}.#{gender_translation_key}"
          end

          def gender_translation_key
            GENDER_TRANSLATION_KEYS[item.number][item.gender]
          end
        end
      end
    end
  end
end
