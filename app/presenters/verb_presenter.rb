class VerbPresenter < MessagePresenter
  include Words::Verbs::Constants

  VERB_CLASSES = {
    "inf" => Verbs::FinitePresenter
  }.freeze

  private

  def corresponding_class
    @corresponding_class ||= VERB_CLASSES[form_name].new(picked_items, requested_word_form)
  end
end
