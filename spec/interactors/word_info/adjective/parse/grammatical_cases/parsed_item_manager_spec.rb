require 'rails_helper'

RSpec.describe WordInfo::Adjective::Parse::GrammaticalCases::ParsedItemManager do
  let(:degree) { 'pos' }
  let(:number) { 'sg' }
  let(:gender) { 'm1' }

  let(:matching_item) { OpenStruct.new(degree:, number:, gender:) }
  let(:non_matching_item) { OpenStruct.new(degree: 'com', number: 'pl', gender: 'f') }
  let(:processed_items) { [non_matching_item, matching_item] }

  let(:context) { { degree:, number:, gender:, processed_items: } }

  subject { described_class.call(**context) }

  before do 
    allow(WordInfo::Adjective::Parse::AdjectiveParser).to receive(:call)
      .with(degree:, number:, gender:, processed_items:)
  end

  describe '.call' do
    context 'when a matching parsed item exists' do
      it 'sets parsed_item to the existing matching item' do
        result = subject

        expect(result.parsed_item).to eq(matching_item)
        expect(WordInfo::Adjective::Parse::AdjectiveParser).not_to have_received(:call)
      end
    end

    context 'when no matching parsed item exists' do
      let(:processed_items) { [non_matching_item] }
      let(:new_item) { OpenStruct.new(degree:, number:, gender:) }

      it 'creates a new parsed item and sets it' do
        subject

        expect(WordInfo::Adjective::Parse::AdjectiveParser).to have_received(:call)
          .with(degree:, number:, gender:, processed_items:)
      end
    end
  end
end
