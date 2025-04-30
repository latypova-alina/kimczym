require "rails_helper"

RSpec.describe WordInfo::Adjective::Parse::Buttons::Translator do
  let(:category) { "number" }
  let(:key_name) { "pl.m1.pos" }

  subject(:translator_context) { described_class.call(category:, key_name:) }

  describe ".call" do
    subject { translator_context.text }

    it { is_expected.to eq("Liczba mnoga") }
  end
end
