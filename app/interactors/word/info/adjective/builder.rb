module Word
  module Info
    module Adjective
      class Builder < Base
        delegate :items, :processed_items, to: :context

        def call
          adjective_iterator do |degree, number, gender, grammatical_case|
            Parse::GrammaticalCases::CasesParser.call(
              items:,
              degree:,
              number:,
              gender:,
              grammatical_case:,
              processed_items:
            )
          end
        end
      end
    end
  end
end
