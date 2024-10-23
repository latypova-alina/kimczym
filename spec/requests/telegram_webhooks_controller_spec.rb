require "rails_helper"

describe TelegramWebhooksController, telegram_bot: :rails do
  describe "#start!" do
    subject { -> { dispatch_command :start } }

    it { should respond_with_message "Hi there! Please give a word" }
  end

  describe "#message" do
    let(:text) { "word" }

    subject { -> { dispatch_message(text) } }

    let(:picked_items) { OpenStruct.new(gif: "gif") }
    let(:message_presenter) do
      {
        parse_mode: "HTML",
        text: "Word Forms"
      }
    end

    let(:expected_message) do
      { parse_mode: "HTML", text: "Word Forms", chat_id: 456 }
    end

    before do
      allow(WordInfo::Picker::Pick).to receive(:call).with(message: "word").and_return(picked_items)
      allow(MessagePresenter).to receive(:call).with(picked_items).and_return(message_presenter)
    end

    it { should respond_with_message "Word Forms" }

    context "when word is not found" do
      let(:expected_message) do
        { parse_mode: "HTML", text: "The word was not found :(", chat_id: 456 }
      end

      before { allow(WordInfo::Picker::Pick).to receive(:call).with(message: "word").and_raise(WordNotFoundError) }

      it { should respond_with_message "The word was not found :(" }
    end
  end
end
