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
            item.cases.map do |grammatical_case|
              "<strong>#{grammatical_case.translation}</strong> #{grammatical_case.value}"
            end.join("\n")
          end
        end
      end
    end
  end
end
