module Word
  module Info
    module Noun
      module Format
        class Heading < Word::Info::Noun::Base
          delegate :item, to: :context

          def call
            context.heading = heading
          end

          private

          def heading
            "<strong>#{item.number.translation}</strong>\n\n"
          end
        end
      end
    end
  end
end
