require "rails_helper"

describe TelegramWebhooksController, telegram_bot: :rails do
  describe "#start!" do
    subject { -> { dispatch_command :start } }

    it { should respond_with_message "Hi there! Please give a word" }
  end

  describe "#message" do
    let(:text) { "word" }

    before { allow(Words::Pickers::WordBasePicker).to receive(:call).with("word").and_return("Word forms") }

    subject { -> { dispatch_message(text) } }

    it { should respond_with_message "Word forms" }

    context "when word is not found" do
      before { allow(Words::Pickers::WordBasePicker).to receive(:call).and_raise(WordNotFoundError) }

      it { should respond_with_message "The word was not found :(" }
    end
  end
end
