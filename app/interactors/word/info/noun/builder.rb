module Word
  module Info
    module Noun
      class Builder < Base
        delegate :items, :processed_items, to: :context

        def call
          noun_iterator do |number, grammatical_case|
            Parse::GrammaticalCases::CasesParser.call(
              items:,
              number:,
              grammatical_case:,
              processed_items:
            )
          end
        end
      end
    end
  end
end
