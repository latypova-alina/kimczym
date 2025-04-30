require 'rails_helper'

RSpec.describe WordInfo::Adjective::Parse::GrammaticalCases::MatchingWord do
  let(:degree) { 'positive' }
  let(:number) { 'singular' }
  let(:gender) { 'masculine_personal' }
  let(:grammatical_case) { 'nominative' }

  let(:matching_form) { "adj: singular : nominative : masculine_personal : positive" }
  let(:non_matching_form) { "adj: plural : accusative : feminine : comparative" }

  let(:items) do
    [
      { "form" => non_matching_form, "word" => "bad" },
      { "form" => matching_form, "word" => "good" }
    ]
  end

  let(:context) { { items:, degree:, number:, gender:, grammatical_case: } }

  subject { described_class.call(**context) }

  describe '.call' do
    it 'sets word on context when a matching item is found' do
      result = subject

      expect(result.word).to eq('good')
    end

    context 'when no matching item is found' do
      let(:items) do
        [
          { "form" => non_matching_form, "word" => "bad" }
        ]
      end

      it 'does not set word on context' do
        result = subject

        expect(result.word).to be_nil
      end
    end
  end
end
