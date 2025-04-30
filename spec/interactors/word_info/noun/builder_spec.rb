require "rails_helper"

RSpec.describe WordInfo::Noun::Builder do
  let(:items) do
    [
      { "form" => "subst:sg:nom:f", "word" => "żabka" },
      { "form" => "subst:sg:gen:f", "word" => "żabki" },
      { "form" => "subst:sg:dat.loc:f", "word" => "żabce" },
      { "form" => "subst:sg:acc:f", "word" => "żabkę" },
      { "form" => "subst:sg:inst:f", "word" => "żabką" },
      { "form" => "subst:sg:voc:f", "word" => "żabko" },
      { "form" => "subst:pl:nom.acc.voc:f", "word" => "żabki" },
      { "form" => "subst:pl:gen:f", "word" => "żabek" },
      { "form" => "subst:pl:dat:f", "word" => "żabkom" },
      { "form" => "subst:pl:inst:f", "word" => "żabkami" },
      { "form" => "subst:pl:loc:f", "word" => "żabkach" }
    ]
  end

  let(:picked_items) do
    Interactor::Context.new(
      message: "żabka",
      initial_word: "żabka",
      items:,
      form_name: "subst",
      default_form: "sg",
      default_item: items.first,
      initial_item: items.first,
      base_item: items.first
    )
  end

  let(:requested_word_forms) { ["sg.f"] }
  let(:processed_items) { [] }

  subject { described_class.call(picked_items:, requested_word_forms:, processed_items:) }

  before do
    allow(WordInfo::Noun::Parse::GrammaticalCases::CasesParser).to receive(:call)
  end

  describe ".call" do
    it "calls CasesParser for each classic grammatical case with correct arguments" do
      subject

      %w[nom gen dat acc inst loc voc].each do |grammatical_case|
        expect(WordInfo::Noun::Parse::GrammaticalCases::CasesParser).to have_received(:call).with(
          items:,
          number: "sg",
          grammatical_case:,
          processed_items:
        )
      end
    end
  end
end
