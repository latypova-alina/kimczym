class TelegramWebhooksController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext

  def start!(*)
    respond_with :message, text: t("telegram_webhooks.start.content")
  end

  def message(message)
    word_info =  Word::Info::Constructor.call(message:)
    session[:word_info] = word_info

    respond_with :message, Presenters::MessagePresenter.call(word_info)
    respond_with :document, document: word_info.word_gif if word_info.word_gif
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  end

  def callback_query(data)
    word_info = session[:word_info] || raise(::WordForgottenError)

    respond_with :message, parse_mode: "HTML", text: word_info.word_forms(data), reply_markup: {
      inline_keyboard: word_info.word_buttons(data).categories.map do |category|
        word_info.word_buttons(data).send(category).map do |button|
          { text: button.translation, callback_data: button.key_name }
        end
      end
    }
  rescue WordNotFoundError
    respond_with :message, text: ErrorHandlers::WordNotFoundHandler.text
    respond_with :document, document: ErrorHandlers::WordNotFoundHandler.image
  rescue WordForgottenError
    respond_with :message, text: ErrorHandlers::ForgottenWordHandler.text
  end
end
