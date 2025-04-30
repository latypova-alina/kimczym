module WordInfo
  module Adjective
    module Format
      class Text < WordInfo::Adjective::Base
        delegate :item, to: :context

        def call
          context.text = heading + body
        end

        private

        def heading
          Heading.call(item:).heading
        end

        def body
          Body.call(item:).body
        end
      end
    end
  end
end
