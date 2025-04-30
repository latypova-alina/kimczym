require 'rails_helper'

RSpec.describe WordInfo::Adjective::Parse::Buttons::ButtonsParser do
  let(:key_name) { 'singular.masculine_personal.positive' }

  let(:item) { build(:adjective, key_name:) }

  let(:number_buttons) { %w[singular plural] }
  let(:gender_buttons) { %w[masculine_personal feminine neuter] }
  let(:degree_buttons) { %w[positive comparative superlative] }

  subject(:parser_context) { described_class.call(item:) }

  before do
    allow(WordInfo::Adjective::Parse::Buttons::CategoryButtonsParser).to receive(:call).with(key_name:, category: "number")
      .and_return(double(parsed_buttons: number_buttons))
    allow(WordInfo::Adjective::Parse::Buttons::CategoryButtonsParser).to receive(:call).with(key_name:, category: "gender")
      .and_return(double(parsed_buttons: gender_buttons))
    allow(WordInfo::Adjective::Parse::Buttons::CategoryButtonsParser).to receive(:call).with(key_name:, category: "degree")
      .and_return(double(parsed_buttons: degree_buttons))
  end

  describe '.call' do
    it 'sets context.buttons with the correct structure' do
      result = parser_context

      expect(result.buttons).to be_a(OpenStruct)
      expect(result.buttons.number).to eq(number_buttons)
      expect(result.buttons.gender).to eq(gender_buttons)
      expect(result.buttons.degree).to eq(degree_buttons)
      expect(result.buttons.key_name).to eq(key_name)
      expect(result.buttons.categories).to eq(Words::Adjectives::Constants::BUTTONS_CATEGORIES)
    end
  end
end
