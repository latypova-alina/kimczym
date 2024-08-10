require "rails_helper"

describe Words::WordInfo do
  let(:message_word) { "example" }
  let(:base_word) { "example" }
  let(:base_item) do
    {
      "word" => "example",
      "base" => "example",
      "book_weight" => 5,
      "gifs" => %w[gif1 gif2 gif3]
    }
  end
  let(:word_forms_items) do
    [
      { "word" => "example", "base" => "example", "book_weight" => 5 },
      { "word" => "examples", "base" => "example", "book_weight" => 3 }
    ]
  end
  let(:word_forms_picker) do
    double("Words::Pickers::WordFormsPicker", base_item:, word_forms_items:)
  end

  before do
    allow(Words::Pickers::WordBasePicker).to receive(:call).with(message_word).and_return(base_word)
    allow(Words::Pickers::WordFormsPicker).to receive(:new).with(base_word).and_return(word_forms_picker)
    allow(Words::Builders::WordFormsBuilder).to receive(:call).with(base_item,
                                                                    word_forms_items).and_return("Formatted word forms")
  end

  subject { described_class.new(message_word) }

  describe "#word_forms" do
    subject { described_class.new(message_word).word_forms }

    it { is_expected.to eq("<strong>Example</strong>\nFormatted word forms") }
  end

  describe "#word_gif" do
    it "returns a random gif from the base item gifs" do
      expect(base_item["gifs"]).to include(subject.word_gif)
    end
  end
end
