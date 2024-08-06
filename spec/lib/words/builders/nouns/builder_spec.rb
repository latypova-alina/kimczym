require "rails_helper"

describe Words::Builders::Nouns::Builder do
  let(:items) { %w[item1 item2 item3] }
  let(:parsed_items) { %w[parsed_item1 parsed_item2 parsed_item3] }
  let(:translated_items) { %w[translated_item1 translated_item2 translated_item3] }
  let(:formatted_items) { %w[formatted_item1 formatted_item2 formatted_item3] }

  subject { described_class.call(items) }

  describe "#call" do
    before do
      allow(Words::Builders::Nouns::Parser).to receive(:call).with(items).and_return(parsed_items)
      allow(Words::Builders::Nouns::Translator).to receive(:call).with(parsed_items).and_return(translated_items)
      allow(Words::Builders::Nouns::Formatter).to receive(:call).with(translated_items).and_return(formatted_items)
    end

    it { is_expected.to eq(formatted_items) }

    it "calls Parser, Translator, and Formatter with the correct arguments" do
      expect(Words::Builders::Nouns::Parser).to receive(:call).with(items)
      expect(Words::Builders::Nouns::Translator).to receive(:call).with(parsed_items)
      expect(Words::Builders::Nouns::Formatter).to receive(:call).with(translated_items)

      subject
    end
  end
end
