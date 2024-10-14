class Base
  def initialize(picked_items, requested_word_form = nil)
    @picked_items = picked_items
    @requested_word_form = requested_word_form || default_form
  end

  def formatted_text
    raise NotImplementedError
  end

  def buttons
    raise NotImplementedError
  end

  private

  attr_reader :picked_items, :requested_word_form

  delegate :default_form, to: :picked_items
end
