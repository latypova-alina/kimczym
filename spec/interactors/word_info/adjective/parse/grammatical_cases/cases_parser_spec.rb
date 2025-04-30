require "rails_helper"

RSpec.describe WordInfo::Adjective::Parse::GrammaticalCases::CasesParser do
  let(:degree) { "positive" }
  let(:number) { "singular" }
  let(:gender) { "masculine_personal" }
  let(:grammatical_case) { "nominative" }
  let(:items) { %w[good better best] }
  let(:processed_items) { [] }

  let(:context) do
    {
      items:,
      degree:,
      number:,
      gender:,
      grammatical_case:,
      processed_items:
    }
  end

  let(:found_word) { "good" }
  let(:parsed_case_word) { "good (parsed)" }
  let(:parsed_item) { double("ParsedItem") }

  subject { described_class.call(**context) }

  before do
    allow(WordInfo::Adjective::Parse::GrammaticalCases::MatchingWord).to receive(:call)
      .with(degree:, number:, gender:, grammatical_case:, items:)
      .and_return(double(word: found_word))

    allow(WordInfo::Adjective::Parse::GrammaticalCases::CaseParser).to receive(:call)
      .with(word: found_word, grammatical_case:)
      .and_return(double(processed_word: parsed_case_word))

    allow(WordInfo::Adjective::Parse::GrammaticalCases::ParsedItemManager).to receive(:call)
      .with(degree:, number:, gender:, grammatical_case:, processed_items:)
      .and_return(double(parsed_item:))

    allow(WordInfo::Adjective::Parse::GrammaticalCases::CaseWriter).to receive(:call)
  end

  describe ".call" do
    context "when a matching word is found" do
      it "calls CaseWriter with correct parsed item and parsed case" do
        subject

        expect(WordInfo::Adjective::Parse::GrammaticalCases::CaseWriter).to have_received(:call)
          .with(item: parsed_item, parsed_case: parsed_case_word)
      end
    end

    context "when no matching word is found" do
      before do
        allow(WordInfo::Adjective::Parse::GrammaticalCases::MatchingWord).to receive(:call)
          .and_return(double(word: nil))
      end

      it "does not call CaseWriter" do
        subject

        expect(WordInfo::Adjective::Parse::GrammaticalCases::CaseWriter).not_to have_received(:call)
      end
    end
  end
end
