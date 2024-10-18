module WordInfo
  module Verb
    module Finite
      module Format
        class JoinedContent < WordInfo::Verb::Base
          delegate :processed_items, to: :context

          def call
            context.formatted_text = processed_items.map { |sub_item| Text.call(item: sub_item).text }.join("\n\n")
          end
        end
      end
    end
  end
end
