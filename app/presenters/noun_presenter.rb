class NounPresenter < Base
  include Words::Nouns::Constants

  def formatted_text
    raise ::WordFormNotFoundError if noun_objects.blank?

    WordInfo::Noun::Formatter.call(processed_items: noun_objects).formatted_text
  end

  private

  def buttons
    WordInfo::Noun::Parse::Buttons::ButtonsParser.call(
      item: noun_objects.first
    ).buttons
  end

  def noun_objects
    WordInfo::Noun::Builder.call(
      picked_items:,
      requested_word_forms:,
      processed_items: []
    ).processed_items
  end

  def requested_word_forms
    [requested_word_form]
  end
end
