class MessagePresenter
  include ApplicationHelper

  def self.call(*args)
    new(*args).call
  end

  def initialize(word_info, button_key = nil)
    @default_form = word_info.default_form
    @items = word_info.processed_items
    @button_key = button_key
  end

  def call
    {
      parse_mode: "HTML",
      text:,
      reply_markup:
    }
  end

  private

  def text
    return default_item.formatted_text unless button_key
    raise ::WordNotFoundError unless item

    item.formatted_text
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

  def buttons
    return default_item.buttons unless button_key
    raise ::WordNotFoundError unless item

    item.buttons
  end

  def default_item
    @default_item ||= find_item(items, default_form) || items[0]
  end

  def item
    @item ||= find_item(items, button_key)
  end

  attr_reader :items, :default_form, :button_key
end
