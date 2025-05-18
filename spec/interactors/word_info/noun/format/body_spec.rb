require "rails_helper"

RSpec.describe WordInfo::Noun::Format::Body do
  let(:item) { build(:noun) }

  let(:expected_result) do
    <<~HTML.strip
      <strong>Mianownik (kto? co?)</strong> kot
      <strong>Dopełniacz (kogo? czego?)</strong> kota
      <strong>Celownik (komu? czemu?)</strong> kotu
      <strong>Biernik (kogo? co?)</strong> kota
      <strong>Narzędnik (z kim? z czym?)</strong> kotem
      <strong>Miejscownik (o kim? o czym?)</strong> kocie
      <strong>Wołacz (o! hej!)</strong> kocie
    HTML
  end

  subject(:context) { described_class.call(item:) }

  describe ".call" do
    it "provides correct body" do
      expect(context.body).to eq(expected_result)
    end
  end
end
