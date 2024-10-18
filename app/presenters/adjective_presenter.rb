class AdjectivePresenter < Base
  include Words::Adjectives::Constants

  def formatted_text
    raise ::WordFormNotFoundError if adjective_objects.blank?

    WordInfo::Adjective::Formatter.call(processed_items: adjective_objects).formatted_text
  end

  def inline_keyboard
    buttons.categories.map do |category|
      buttons.send(category).map do |button|
        { text: button.translation, callback_data: button.key_name }
      end
    end
  end

  private

  def adjective_objects
    WordInfo::Adjective::Builder.call(
      picked_items:,
      requested_word_forms:,
      processed_items: []
    ).processed_items
  end

  def buttons
    WordInfo::Adjective::Parse::Buttons::ButtonsParser.call(
      item: adjective_objects.first
    ).buttons
  end

  def requested_word_forms
    JOIN_CONTENTS[single_gender_word_form] || [single_gender_word_form]
  end

  def single_gender_word_form
    splitted_form = requested_word_form.split(".")
    [splitted_form[0], splitted_form[1], splitted_form[-1]].join(".")
  end
end
