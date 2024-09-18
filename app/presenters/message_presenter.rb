module Presenters
  class MessagePresenter
    def self.call(*args)
      new(*args).call
    end

    def initialize(word_info)
      @word_info = word_info
    end

    def call
      {
        parse_mode: "HTML",
        text: default_word_forms,
        reply_markup:
      }
    end

    private

    def reply_markup
      {
        inline_keyboard:
      }
    end

    def default_word_forms
      @default_word_forms ||= word_info.default_word_forms
    end

    def default_word_buttons
      @default_word_buttons ||= word_info.default_word_buttons
    end

    def inline_keyboard
      default_word_buttons.categories.map do |category|
        default_word_buttons.send(category).map do |button|
          { text: button.translation, callback_data: button.key_name }
        end
      end
    end

    attr_reader :word_info
  end
end
