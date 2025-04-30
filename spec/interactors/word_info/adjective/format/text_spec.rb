require "rails_helper"

RSpec.describe WordInfo::Adjective::Format::Text do
  let(:item) { build(:adjective) }

  let(:heading) { "<strong>Stopień równy / Liczba pojedyncza / Rodzaj męski osobowy</strong>\n\n" }
  let(:body) { "To jest przykładowy opis przymiotnika." }
  let(:expected_text) { heading + body }

  subject(:context) { described_class.call(item:) }

  before do
    allow(WordInfo::Adjective::Format::Heading).to receive(:call).with(item:).and_return(double(heading:))
    allow(WordInfo::Adjective::Format::Body).to receive(:call).with(item:).and_return(double(body:))
  end

  describe ".call" do
    it "sets the correct text by combining heading and body" do
      expect(context.text).to eq(expected_text)
    end
  end
end
