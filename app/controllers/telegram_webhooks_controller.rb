class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    respond_with :message, text: t("telegram_webhooks.start.content")
  end

  def message(message)
    word_info = Words::WordInfo.new(message["text"].downcase)

    session[:word_info] = word_info
    respond_with :message, parse_mode: "HTML", text: word_info.default_word_forms, reply_markup: {
      inline_keyboard: [
        word_info.default_word_buttons.number.map { |button| { text: button.translation, callback_data: button.key_name } },
        word_info.default_word_buttons.gender.map { |button| { text: button.translation, callback_data: button.key_name } },
        word_info.default_word_buttons.degree.map { |button| { text: button.translation, callback_data: button.key_name } }
      ]
    }
    respond_with :document, document: word_info.word_gif if word_info.word_gif
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  end

  def callback_query(data)
    word_info = session[:word_info] || Words::WordInfo.new(message["text"].downcase)

    respond_with :message, parse_mode: "HTML", text: word_info.word_forms(data), reply_markup: {
      inline_keyboard: word_info.word_buttons(data).map do |_category, buttons|
        buttons.map do |button|
          { text: button.translation, callback_data: button.key_name }
        end
      end
    }

    respond_with :message, parse_mode: "HTML", text: word_info.word_forms(data), reply_markup: {
      inline_keyboard: [
        word_info.word_buttons(data).number.map { |button| { text: button.translation, callback_data: button.key_name } },
        word_info.word_buttons(data).gender.map { |button| { text: button.translation, callback_data: button.key_name } },
        word_info.word_buttons(data).degree.map { |button| { text: button.translation, callback_data: button.key_name } }
      ]
    }
  end
end
