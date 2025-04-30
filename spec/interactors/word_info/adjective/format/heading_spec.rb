require "rails_helper"

RSpec.describe WordInfo::Adjective::Format::Heading do
  let(:item) { build(:adjective) }
  let(:expected_result) { "<strong>Stopień równy / Liczba pojedyncza / Rodzaj męski osobowy</strong>\n\n" }

  subject(:context) { described_class.call(item:) }

  describe ".call" do
    it "sets the correct heading" do
      expect(context.heading).to eq(expected_result)
    end
  end
end
