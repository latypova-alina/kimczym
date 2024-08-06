require "rails_helper"

describe Words::Builders::Nouns::Parser do
  let(:items) do
    [
      { "form" => "subst:pl:loc", "word" => "kotach" },
      { "form" => "subst:pl:dat", "word" => "kotom" },
      { "form" => "subst:sg:acc", "word" => "kota" },
      { "form" => "subst:sg:nom", "word" => "kot" },
      { "form" => "subst:sg:gen", "word" => "kota" },
      { "form" => "subst:sg:dat", "word" => "kotu" },
      { "form" => "subst:sg:loc", "word" => "kocie" },
      { "form" => "subst:sg:voc", "word" => "kocie" },
      { "form" => "subst:pl:nom", "word" => "koty" },
      { "form" => "subst:pl:gen", "word" => "kotów" },
      { "form" => "subst:sg:inst", "word" => "kotem" },
      { "form" => "subst:pl:inst", "word" => "kotami" },
      { "form" => "subst:pl:nom.acc.voc:m2", "word" => "koty" },
      { "form" => "depr:pl:nom.acc.voc:m2", "word" => "koty" }
    ]
  end

  subject { described_class.call(items) }

  describe "#call" do
    let(:expected_result) do
      {
        subst: {
          "sg" => {
            "nom" => "kot",
            "gen" => "kota",
            "dat" => "kotu",
            "acc" => "kota",
            "inst" => "kotem",
            "loc" => "kocie",
            "voc" => "kocie"
          },
          "pl" => {
            "nom" => "koty",
            "gen" => "kotów",
            "dat" => "kotom",
            "acc" => "koty",
            "inst" => "kotami",
            "loc" => "kotach",
            "voc" => "koty"
          }
        }
      }
    end

    it { is_expected.to eq(expected_result) }
  end
end
