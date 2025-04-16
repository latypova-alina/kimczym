module Verbs
  class FinitePresenter < Base
    include Words::Verbs::Constants

    def formatted_text
      raise ::WordFormNotFoundError if finite_objects.blank?

      WordInfo::Verb::Finite::Formatter.call(processed_items: finite_objects).formatted_text
    end

    def inline_keyboard
      buttons.map do |button|
        [{ text: button.translation, callback_data: button.key_name }]
      end
    end

    private

    def buttons
      WordInfo::Verb::Buttons::Builder.call(key_name: FINITE_NAME).buttons
    end

    def finite_objects
      WordInfo::Verb::Finite::Builder.call(
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
