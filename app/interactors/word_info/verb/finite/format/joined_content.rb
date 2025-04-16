module WordInfo
  module Verb
    module Finite
      module Format
        class JoinedContent < WordInfo::Verb::Base
          delegate :processed_items, to: :context

          def call
            context.formatted_text = processed_items.map { |sub_item| Body.call(item: sub_item).body }.join("\n")
          end
        end
      end
    end
  end
end
