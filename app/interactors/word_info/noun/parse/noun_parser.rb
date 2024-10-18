module WordInfo
  module Noun
    module Parse
      class NounParser < WordInfo::Noun::Base
        delegate :number, :processed_items, to: :context

        def call
          processed_items << ::Noun.new(number:, key_name: number)
        end
      end
    end
  end
end
