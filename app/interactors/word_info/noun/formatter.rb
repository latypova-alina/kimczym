module WordInfo
  module Noun
    class Formatter < Base
      delegate :processed_items, to: :context

      def call
        context.formatted_text = Format::JoinedContent.call(processed_items:).formatted_text
      end
    end
  end
end
