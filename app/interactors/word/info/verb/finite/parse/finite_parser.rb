module Word
  module Info
    module Verb
      module Finite
        module Parse
          class FiniteParser < Word::Info::Verb::Base
            delegate :number, :processed_items, :key_name, to: :context

            def call
              processed_items << ::Verbs::Finite.new(number:, key_name:)
            end
          end
        end
      end
    end
  end
end
