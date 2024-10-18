module WordInfo
  module Verb
    module Finite
      module Format
        class Body < WordInfo::Verb::Base
          delegate :item, to: :context

          def call
            context.body = body
          end

          private

          def body
            CLASSIC_PERSON_ORDER.map do |person|
              person_value = item.send(person)

              "<strong>#{I18n.t(person_translation_key(person))}</strong> #{person_value}"
            end
          end

          def person_translation_key(person)
            "#{NAME}.#{FINITE_NAME}.#{item.number}.#{person}"
          end
        end
      end
    end
  end
end
