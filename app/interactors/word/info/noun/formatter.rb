module Word
  module Info
    module Noun
      class Formatter < Base
        delegate :processed_items, to: :context

        def call
          processed_items.each do |item|
            item.formatted_text = Format::JoinedContent.call(item:, processed_items:).formatted_text
          end
        end
      end
    end
  end
end
