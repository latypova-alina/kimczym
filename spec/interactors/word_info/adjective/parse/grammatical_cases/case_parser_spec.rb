require 'rails_helper'

RSpec.describe WordInfo::Adjective::Parse::GrammaticalCases::CaseParser do
  let(:word) { 'good' }
  let(:grammatical_case) { 'nominative' }
  let(:context) { { word:, grammatical_case: } }

  subject { described_class.call(**context) }

  describe '.call' do
    it 'sets processed_word on context with correct name and value' do
      result = subject

      expect(result.processed_word).to have_attributes(name: grammatical_case, value: word)
    end
  end
end
