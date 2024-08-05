class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    respond_with :message, text: t("telegram_webhooks.start.content")
  end

  def message(message)
    word_info = Words::WordInfo.new(message["text"].downcase)

    respond_with :message, parse_mode: "HTML", text: word_info.word_forms
    respond_with :document, document: word_info.word_gif if word_info.word_gif
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  end
end
