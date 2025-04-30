require 'rails_helper'

RSpec.describe WordInfo::Adjective::Parse::GrammaticalCases::CaseWriter do
  let(:item) { OpenStruct.new }
  let(:parsed_case) { OpenStruct.new(name: 'nominative', value: 'good') }

  subject { described_class.call(item:, parsed_case:) }

  describe '.call' do
    it 'sets the value on the item using parsed_case name' do
      expect { subject }
        .to change { item.nominative }
        .from(nil)
        .to('good')
    end
  end
end
