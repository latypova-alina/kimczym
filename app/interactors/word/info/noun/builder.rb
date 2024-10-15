module Word
  module Info
    module Noun
      class Builder < Base
        delegate :picked_items, :requested_word_forms, :processed_items, to: :context
        delegate :items, to: :picked_items

        def call
          requested_word_forms.each do |word_form|
            splitted_form = splitted_form(word_form)

            CLASSIC_CASES_ORDER.each do |grammatical_case|
              Parse::GrammaticalCases::CasesParser.call(
                items:,
                number: splitted_form[0],
                grammatical_case:,
                processed_items:
              )
            end
          end
        end
      end
    end
  end
end
