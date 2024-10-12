class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    respond_with :message, text: t("telegram_webhooks.start.content")
  end

  def message(message)
    word_info =  Word::Info::Constructor.call(message: message["text"])
    session[:word_info] = word_info

    respond_with :message, ::MessagePresenter.call(word_info)
    respond_with :document, document: word_info.gif if word_info.gif
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  end

  def callback_query(data)
    word_info = session[:word_info] || raise(::WordForgottenError)

    respond_with :message, ::MessagePresenter.call(word_info, data)
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  rescue WordForgottenError
    respond_with :message, text: ErrorHandlers::ForgottenWordHandler.text
  rescue WordFormNotFoundError
    respond_with :message, text: ErrorHandlers::WordFormNotFoundHandler.text
  end
end
