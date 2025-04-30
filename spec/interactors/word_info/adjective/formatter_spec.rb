require "rails_helper"

RSpec.describe WordInfo::Adjective::Formatter do
  let(:adjective_1) { build(:adjective) }
  let(:adjective_2) { build(:adjective) }
  let(:processed_items) { [adjective_1, adjective_2] }
  let(:formatted_text) { "formatted result" }

  subject { described_class.call(processed_items:) }

  before do
    allow(WordInfo::Adjective::Format::JoinedContent).to receive(:call)
      .with(processed_items:)
      .and_return(double(formatted_text: formatted_text))
  end

  describe ".call" do
    it "sets formatted_text on context using JoinedContent" do
      result = subject
      
      expect(result.formatted_text).to eq(formatted_text)
    end
  end
end
