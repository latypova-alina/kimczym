require "rails_helper"

RSpec.describe WordInfo::Adjective::Format::Body do
  let(:item) { build(:adjective) }
  let(:expected_result) do
    <<~HTML.strip
      <strong>Mianownik (jaki?)</strong> dobry
      <strong>Dopełniacz (jakiego?)</strong> dobrego
      <strong>Celownik (jakiemu?)</strong> dobremu
      <strong>Biernik (jaki?)</strong> dobrego
      <strong>Narzędnik (z jakim?)</strong> dobrym
      <strong>Miejscownik (o jakim?)</strong> dobrym
      <strong>Wołacz (jaki?)</strong> dobry
    HTML
  end

  subject(:context) { described_class.call(item:) }

  describe ".call" do
    it "provides correct body" do
      expect(context.body).to eq(expected_result)
    end
  end
end
