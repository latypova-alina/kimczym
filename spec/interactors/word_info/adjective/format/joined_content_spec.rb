require 'rails_helper'

RSpec.describe WordInfo::Adjective::Format::JoinedContent do
  let(:processed_items) { [build(:adjective), build(:adjective, :feminine)] }
  let(:expected_result) { "<strong>Stopień równy / Liczba pojedyncza / Rodzaj męski osobowy</strong>\n\n" }

  let(:expected_result) do
    <<~HTML.strip
      <strong>Stopień równy / Liczba pojedyncza / Rodzaj męski osobowy</strong>
      
      <strong>Mianownik (jaki?)</strong> dobry
      <strong>Dopełniacz (jakiego?)</strong> dobrego
      <strong>Celownik (jakiemu?)</strong> dobremu
      <strong>Biernik (jaki?)</strong> dobrego
      <strong>Narzędnik (z jakim?)</strong> dobrym
      <strong>Miejscownik (o jakim?)</strong> dobrym
      <strong>Wołacz (jaki?)</strong> dobry
      
      <strong>Stopień równy / Liczba pojedyncza / Rodzaj żeński</strong>
      
      <strong>Mianownik (jaka?)</strong> dobra
      <strong>Dopełniacz (jakiej?)</strong> dobrej
      <strong>Celownik (jakiej?)</strong> dobrej
      <strong>Biernik (jaką?)</strong> dobrą
      <strong>Narzędnik (z jaką?)</strong> dobrą
      <strong>Miejscownik (o jakiej?)</strong> dobrej
      <strong>Wołacz (jaka?)</strong> dobra
    HTML
  end

  subject(:context) { described_class.call(processed_items: processed_items) }

  describe '.call' do
    it "sets the correct formatted_text" do
      expect(context.formatted_text).to eq(expected_result)
    end
  end
end
