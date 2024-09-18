module Words
  class WordInfo
    include ApplicationHelper

    delegate :base_item, :word_forms_items, to: :word_forms_picker

    def initialize(message_word)
      @message_word = message_word
    end

    def main_word
      "<strong>#{message_word.capitalize}</strong>\n"
    end

    def word_forms(button_key)
      raise ::WordNotFoundError if item(button_key).nil?

      item(button_key).formatted_text
    end

    def word_buttons(button_key)
      raise ::WordNotFoundError if item(button_key).nil?

      item(button_key).buttons
    end

    def default_word_forms
      formatted_word_forms.first.formatted_text
    end

    def default_word_buttons
      formatted_word_forms.first.buttons
    end

    def word_gif
      base_item["gifs"].sample
    end

    private

    def item(button_key)
      find_item(formatted_word_forms, button_key)
    end

    def formatted_word_forms
      Builders::WordFormsBuilder.call(base_item, word_forms_items)
    end

    def word_forms_picker
      Pickers::WordFormsPicker.new(base_word)
    end

    def base_word
      Pickers::WordBasePicker.call(message_word)
    end

    attr_reader :message_word
  end
end
