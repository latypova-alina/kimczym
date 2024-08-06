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
      before { allow_any_instance_of(Words::Builders::Nouns::Builder).to receive(:call).and_return("expected_result") }

      it "calls the correct builder class with filtered items" do
        expect(subject).to eq("expected_result")
        expect(Nouns::Builder).to have_received(:call).with([
                                                              { "form" => "subst:sg:gen", "word" => "kota" }
                                                            ])
      end
    end

    context "when form_name is not in BUILDER_CLASSES" do
      let(:base_item) { { "form" => "unknown:sg:gen" } }

      it { is_expected.to raise_error(KeyError) }
    end
  end
end
