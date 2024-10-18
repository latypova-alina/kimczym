module WordInfo
  module Verb
    module Finite
      class Formatter < WordInfo::Verb::Base
        delegate :processed_items, to: :context

        def call
          context.formatted_text = Format::JoinedContent.call(processed_items:).formatted_text
        end
      end
    end
  end
end
