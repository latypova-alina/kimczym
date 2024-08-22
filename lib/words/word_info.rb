module Words
  class WordInfo
    delegate :base_item, :word_forms_items, to: :word_forms_picker

    def initialize(message_word)
      @message_word = message_word
    end

    def main_word
      "<strong>#{message_word.capitalize}</strong>\n"
    end

    def word_forms
      formatted_word_forms
    end

    def word_gif
      base_item["gifs"].sample
    end

    private

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
