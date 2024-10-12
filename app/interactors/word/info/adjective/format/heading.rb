module Word
  module Info
    module Adjective
      module Format
        class Heading < Word::Info::Adjective::Base
          delegate :item, to: :context

          def call
            context.heading = heading
          end

          private

          def heading
            "<strong>#{item.degree.translation} / #{item.number.translation} / #{item.gender.translation}</strong>\n\n"
          end
        end
      end
    end
  end
end
