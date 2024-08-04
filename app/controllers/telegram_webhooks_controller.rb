class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    respond_with :message, text: t("telegram_webhooks.start.content")
  end

  def message(message)
    respond_with :message, text: Words::Pickers::WordBasePicker.call(message["text"])
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  end
end
