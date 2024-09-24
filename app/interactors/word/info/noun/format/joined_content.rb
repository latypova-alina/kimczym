module Word
  module Info
    module Noun
      module Format
        class JoinedContent < Word::Info::Noun::Base
          delegate :item, :processed_items, to: :context

          def call
            context.formatted_text = formatted_text
          end

          private

          def formatted_text
            Text.call(item:).text
          end
        end
      end
    end
  end
end
