require 'rails_helper'

RSpec.describe WordInfo::Adjective::Parse::Buttons::CategoryButtonsParser do
  let(:key_name) { 'sg.m1.pos' }
  let(:category) { 'number' }

  subject(:parser_context) { described_class.call(key_name:, category:) }

  describe '.call' do
    it 'sets context.parsed_buttons with parsed button structs' do
      result = parser_context

      expected_keys = Words::Adjectives::Constants::BUTTONS[key_name][category]

      expect(result.parsed_buttons.map(&:key_name)).to match_array(expected_keys)
      expect(result.parsed_buttons.map(&:translation)).to match_array(['Liczba mnoga'])
    end
  end
end
