module WordInfo
  module Verb
    module Finite
      module Format
        class Text < WordInfo::Verb::Base
          delegate :item, to: :context

          def call
            context.text = body
          end

          private

          def body
            Body.call(item:).body
          end
        end
      end
    end
  end
end
