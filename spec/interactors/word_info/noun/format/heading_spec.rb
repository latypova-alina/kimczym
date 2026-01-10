require "rails_helper"

RSpec.describe WordInfo::Noun::Format::Heading do
  let(:item) { build(:noun) }
  let(:expected_result) { "<strong>Liczba pojedyncza</strong>\n\n" }

  subject(:context) { described_class.call(item:) }

  describe ".call" do
    it "sets the correct heading" do
      expect(context.heading).to eq(expected_result)
    end
  end
end
