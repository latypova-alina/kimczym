class AdjectivePresenter < Base
  include Words::Adjectives::Constants

  def formatted_text
    raise ::WordFormNotFoundError if adjective_objects.blank?

    Word::Info::Adjective::Formatter.call(processed_items: adjective_objects).formatted_text
  end

  def buttons
    Word::Info::Adjective::Parse::Buttons::ButtonsParser.call(
      item: adjective_objects.first
    ).buttons
  end

  private

  def adjective_objects
    Word::Info::Adjective::Builder.call(
      picked_items:,
      requested_word_forms:,
      processed_items: []
    ).processed_items
  end

  def requested_word_forms
    JOIN_CONTENTS[single_gender_word_form] || [single_gender_word_form]
  end

  def single_gender_word_form
    splitted_form = requested_word_form.split(".")
    [splitted_form[0], splitted_form[1], splitted_form[-1]].join(".")
  end
end
