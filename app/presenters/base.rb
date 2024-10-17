class Base
  def initialize(picked_items, requested_word_form = nil)
    @picked_items = picked_items
    @requested_word_form = requested_word_form || default_form
  end

  def formatted_text
    raise NotImplementedError
  end

  def inline_keyboard
    buttons.categories.map do |category|
      buttons.send(category).map do |button|
        { text: button.translation, callback_data: button.key_name }
      end
    end
  end

  private

  def buttons
    raise NotImplementedError
  end

  attr_reader :picked_items, :requested_word_form

  delegate :default_form, to: :picked_items
end
