module WordInfo
  module Verb
    module Finite
      module Format
        class Text < WordInfo::Verb::Base
          delegate :item, to: :context

          def call
            context.text = heading << body
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
end
