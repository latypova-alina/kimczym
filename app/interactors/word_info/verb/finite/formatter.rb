module WordInfo
  module Verb
    module Finite
      class Formatter < WordInfo::Verb::Base
        delegate :processed_items, to: :context

        def call
          context.formatted_text = heading << joined_content
        end

        private

        def heading
          Format::Heading.call.heading
        end

        def joined_content
          Format::JoinedContent.call(processed_items:).formatted_text
        end
      end
    end
  end
end
