require 'rails_helper'

RSpec.describe WordInfo::Adjective::Parse::AdjectiveParser do
  let(:number) { 'sg' }
  let(:degree) { 'pos' }
  let(:gender) { 'm1' }
  let(:processed_items) { [] }

  let(:context) { { number:, degree:, gender:, processed_items: } }

  subject(:parser_context) { described_class.call(**context) }

  describe '.call' do
    it 'adds a new Adjective to processed_items with correct attributes' do
      expect { parser_context }.to change { processed_items.size }.by(1)

      adjective = processed_items.first
      expect(adjective).to be_an_instance_of(Adjective)
      expect(adjective.number).to eq(number)
      expect(adjective.degree).to eq(degree)
      expect(adjective.gender).to eq(gender)
      expect(adjective.key_name).to eq("#{number}.#{gender}.#{degree}")
    end
  end
end
