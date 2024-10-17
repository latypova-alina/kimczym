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
      reply_markup: { inline_keyboard: }
    }
  end

  private

  delegate :form_name, to: :picked_items
  delegate :formatted_text, :inline_keyboard, to: :corresponding_class

  def corresponding_class
    @corresponding_class ||= PRESENTER_CLASSES[form_name].new(picked_items, requested_word_form)
  end
end
