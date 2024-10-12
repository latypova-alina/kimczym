module Word
  module Info
    module Verb
      module Finite
        module Format
          class JoinedContent < Word::Info::Verb::Base
            delegate :item, to: :context

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
end
