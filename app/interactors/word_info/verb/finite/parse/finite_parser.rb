module WordInfo
  module Verb
    module Finite
      module Parse
        class FiniteParser < WordInfo::Verb::Base
          delegate :number, :processed_items, :key_name, to: :context

          def call
            processed_items << ::Verbs::Finite.new(number:, key_name:)
          end
        end
      end
    end
  end
end
