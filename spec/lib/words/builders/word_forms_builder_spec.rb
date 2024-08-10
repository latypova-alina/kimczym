require "rails_helper"

describe Words::Builders::WordFormsBuilder do
  let(:base_item) { { "form" => "subst:sg:gen" } }
  let(:items) do
    [
      { "form" => "subst:sg:gen", "word" => "kota" },
      { "form" => "subst:pl:nom", "word" => "koty" }
    ]
  end

  subject { described_class.call(base_item, items) }

  describe "#call" do
    context 'when form_name is "subst"' do
      before { allow(Words::Builders::Nouns::Builder).to receive(:call).and_return("expected_result") }

      it "calls the correct builder class with filtered items" do
        expect(subject).to eq("expected_result")
        expect(Words::Builders::Nouns::Builder).to have_received(:call).with([
                                                                               { "form" => "subst:sg:gen",
                                                                                 "word" => "kota" },
                                                                               { "form" => "subst:pl:nom",
                                                                                 "word" => "koty" }
                                                                             ])
      end
    end

    context "when form_name is not in BUILDER_CLASSES" do
      let(:base_item) { { "form" => "unknown:sg:gen" } }

      before { allow(described_class).to receive(:call).and_raise(WordNotFoundError) }

      it "raises WordNotFoundError if form is not identified" do
        expect { subject }.to raise_error(WordNotFoundError)
      end
    end
  end
end
