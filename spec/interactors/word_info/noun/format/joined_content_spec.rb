require "rails_helper"

RSpec.describe WordInfo::Noun::Format::JoinedContent do
  let(:processed_items) { [build(:noun), build(:noun, :plural)] }
  let(:expected_result) { "<strong>Stopień równy / Liczba pojedyncza / Rodzaj męski osobowy</strong>\n\n" }

  let(:expected_result) do
    <<~HTML.strip
      <strong>Liczba pojedyncza</strong>

      <strong>Mianownik (kto? co?)</strong> kot
      <strong>Dopełniacz (kogo? czego?)</strong> kota
      <strong>Celownik (komu? czemu?)</strong> kotu
      <strong>Biernik (kogo? co?)</strong> kota
      <strong>Narzędnik (z kim? z czym?)</strong> kotem
      <strong>Miejscownik (o kim? o czym?)</strong> kocie
      <strong>Wołacz (o! hej!)</strong> kocie

      <strong>Liczba mnoga</strong>

      <strong>Mianownik (kto? co?)</strong> koty
      <strong>Dopełniacz (kogo? czego?)</strong> kotów
      <strong>Celownik (komu? czemu?)</strong> kotom
      <strong>Biernik (kogo? co?)</strong> koty
      <strong>Narzędnik (z kim? z czym?)</strong> kotami
      <strong>Miejscownik (o kim? o czym?)</strong> kotach
      <strong>Wołacz (o! hej!)</strong> koty
    HTML
  end

  subject(:context) { described_class.call(processed_items:) }

  describe ".call" do
    it "sets the correct formatted_text" do
      expect(context.formatted_text).to eq(expected_result)
    end
  end
end
