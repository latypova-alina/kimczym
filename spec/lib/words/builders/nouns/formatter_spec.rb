require "rails_helper"

describe Words::Builders::Nouns::Formatter do
  let(:items) do
    {
      "sg" => { "nom" => "kot", "gen" => "kota" },
      "pl" => { "nom" => "koty", "gen" => "kotów" }
    }
  end

  subject { described_class.call(items) }

  describe "#call" do
    let(:expected_result) do
      "\n<strong>sg</strong>\n\n<strong>nom</strong> kot\n<strong>gen</strong> kota\n\n" \
        "<strong>pl</strong>\n\n<strong>nom</strong> koty\n<strong>gen</strong> kotów\n"
    end

    it { is_expected.to eq(expected_result) }

    context "when key is empty" do
      let(:items) do
        {
          "sg" => {},
          "pl" => { "nom" => "koty", "gen" => "kotów" }
        }
      end

      let(:expected_result) do
        "\n<strong>pl</strong>\n\n<strong>nom</strong> koty\n<strong>gen</strong> kotów\n"
      end

      it { is_expected.to eq(expected_result) }
    end
  end
end
