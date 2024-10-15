class MessagePresenter < Base
  PRESENTER_CLASSES = {
    "adj" => ::AdjectivePresenter,
    "subst" => ::NounPresenter
  }.freeze

  def self.call(*args)
    new(*args).call
  end

  def call
    {
      parse_mode: "HTML",
      text: formatted_text,
      reply_markup:
    }
  end

  private

  delegate :form_name, to: :picked_items
  delegate :formatted_text, :buttons, to: :corresponding_class

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

  def corresponding_class
    @corresponding_class ||= PRESENTER_CLASSES[form_name].new(picked_items, requested_word_form)
  end
end
