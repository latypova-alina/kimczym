class MessagePresenter < Base
  PRESENTER_CLASSES = {
    "adj" => ::AdjectivePresenter,
    "subst" => ::NounPresenter,
    "inf" => ::VerbPresenter
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

  delegate :form_name, to: :picked_items
  delegate :formatted_text, :buttons, to: :corresponding_class

  def corresponding_class
    @corresponding_class ||= PRESENTER_CLASSES[form_name].new(picked_items, requested_word_form)
  end
end
