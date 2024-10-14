class MessagePresenter < Base
  PRESENTER_CLASSES = {
    "adj" => ::AdjectivePresenter
  }.freeze

  def self.call(*args)
    new(*args).call
  end

  def call
    {
      parse_mode: "HTML",
      text:,
      reply_markup:
    }
  end

  private

  delegate :form_name, to: :picked_items

  def text
    formatted_text
  end

  def reply_markup
    { inline_keyboard: }
  end

  def inline_keyboard
    buttons.categories.map do |category|
      buttons.send(category).map do |button|
        { text: button.translation, callback_data: button.key_name }
      end
    end
  end

  def formatted_text
    corresponding_class.formatted_text
  end

  def buttons
    corresponding_class.buttons
  end

  def corresponding_class
    @corresponding_class ||= PRESENTER_CLASSES[form_name].new(picked_items, requested_word_form)
  end
end
