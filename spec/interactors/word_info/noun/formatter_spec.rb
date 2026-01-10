require "rails_helper"

RSpec.describe WordInfo::Noun::Formatter do
  let(:noun_1) { build(:noun) }
  let(:noun_2) { build(:noun) }
  let(:processed_items) { [noun_1, noun_2] }
  let(:formatted_text) { "formatted noun result" }

  subject { described_class.call(processed_items:) }

  before do
    allow(WordInfo::Noun::Format::JoinedContent).to receive(:call)
      .with(processed_items:)
      .and_return(double(formatted_text:))
  end

  describe ".call" do
    it "sets formatted_text on context using JoinedContent" do
      result = subject

      expect(result.formatted_text).to eq(formatted_text)
    end
  end
end
