module WordInfo
  module Verb
    module Finite
      class Builder < WordInfo::Verb::Base
        delegate :picked_items, :requested_word_forms, :processed_items, to: :context
        delegate :items, to: :picked_items

        def call
          requested_word_forms.each do |word_form|
            splitted_form = splitted_form(word_form)

            CLASSIC_PERSON_ORDER.each do |person|
              Parse::Persons::PersonsParser.call(
                items:,
                processed_items:,
                number: splitted_form[1],
                key_name: word_form,
                person:
              )
            end
          end
        end
      end
    end
  end
end
