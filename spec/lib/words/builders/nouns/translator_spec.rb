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

  let(:translations) do
    {
      subst: {
        sg: "Singular",
        pl: "Plural",
        nom: "Nominative",
        gen: "Genitive"
      }
    }
  end

  before do
    I18n.backend = I18n::Backend::KeyValue.new({}, true)
    I18n.backend.store_translations(:en, translations)
  end

  subject { described_class.call(items) }

  describe "#call" do
    let(:expected_result) do
      {
        "Singular" => {
          "Nominative" => "kot",
          "Genitive" => "kota"
        },
        "Plural" => {
          "Nominative" => "koty",
          "Genitive" => "kotów"
        }
      }
    end

    it { is_expected.to eq(expected_result) }
  end
end
