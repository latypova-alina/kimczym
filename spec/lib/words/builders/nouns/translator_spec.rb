require "rails_helper"

describe Words::Builders::Nouns::Translator do
  let(:items) do
    {
      subst: {
        "sg" => { "nom" => "kot", "gen" => "kota" },
        "pl" => { "nom" => "koty", "gen" => "kotów" }
      }
    }
  end

  subject { described_class.call(items) }

  describe "#call" do
    let(:expected_result) do
      {
        "Liczba mnoga" => { "Dopełniacz (kogo? czego?)" => "kotów", "Mianownik (kto? co?)" => "koty" },
        "Liczba pojedyncza" => { "Dopełniacz (kogo? czego?)" => "kota", "Mianownik (kto? co?)" => "kot" }
      }
    end

    it { is_expected.to eq(expected_result) }
  end
end
