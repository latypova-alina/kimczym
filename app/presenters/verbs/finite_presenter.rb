module Verbs
  class FinitePresenter < Base
    include Words::Verbs::Constants

    def formatted_text
      raise ::WordFormNotFoundError if finite_objects.blank?

      Word::Info::Verb::Finite::Formatter.call(processed_items: finite_objects).formatted_text
    end

    def buttons
      Word::Info::Verb::Buttons::Builder.call(verb_form: FINITE_NAME).buttons
    end

    private

    def finite_objects
      Word::Info::Verb::Finite::Builder.call(
        picked_items:,
        requested_word_forms:,
        processed_items: []
      ).processed_items
    end

    def requested_word_forms
      FIN_JOIN_CONTENTS[requested_word_form] || [requested_word_form]
    end
  end
end
