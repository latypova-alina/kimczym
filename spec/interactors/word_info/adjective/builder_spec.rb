require "rails_helper"

RSpec.describe WordInfo::Adjective::Builder do
  let(:picked_items) { double("PickedItems", items:) }
  let(:items) do
    [
      { "form" => "adj:sg:nom:m1:pos", "base" => "dobry", "word" => "dobry" },
      { "form" => "adj:sg:gen:f:pos", "base" => "dobry", "word" => "dobrej" }
    ]
  end
  let(:requested_word_forms) { ["sg:nom:m1", "sg:gen:f"] }
  let(:processed_items) { [] }

  let(:context) do
    {
      picked_items:,
      requested_word_forms:,
      processed_items:
    }
  end

  subject { described_class.call(context) }

  describe ".call" do
    before { allow(WordInfo::Adjective::Parse::GrammaticalCases::CasesParser).to receive(:call) }

    it "calls the CasesParser for each requested word form and case" do
      subject

      requested_word_forms.each do |word_form|
        %w[nom gen dat acc inst loc voc].each do |grammatical_case|
          expect(WordInfo::Adjective::Parse::GrammaticalCases::CasesParser).to have_received(:call).with(
            items:,
            degree: word_form.split(".")[2],
            number: word_form.split(".")[0],
            gender: word_form.split(".")[1],
            grammatical_case:,
            processed_items:
          ).once
        end
      end
    end
  end
end
