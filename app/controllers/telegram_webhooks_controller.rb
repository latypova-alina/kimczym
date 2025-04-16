class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    respond_with :message, text: t("telegram_webhooks.start.content")
  end

  def message(message)
    picked_items = WordInfo::Picker::Pick.call(message: message["text"])
    session[:picked_items] = picked_items

    respond_with :message, MessagePresenter.call(picked_items)
    respond_with :document, document: picked_items.gif if picked_items.gif
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  end

  def callback_query(data)
    picked_items = session[:picked_items] || raise(::WordForgottenError)

    respond_with :message, MessagePresenter.call(picked_items, data)
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  rescue WordForgottenError
    respond_with :message, text: ErrorHandlers::ForgottenWordHandler.text
  rescue WordFormNotFoundError
    respond_with :message, text: ErrorHandlers::WordFormNotFoundHandler.text
  end
end
