require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#dynamodb" do
    let(:dynamodb_client) { instance_double("DynamoDbClient") }

    subject { helper.dynamodb }

    before { allow(DynamoDb).to receive(:client).and_return(dynamodb_client) }

    it { is_expected.to eq(dynamodb_client) }
  end
end
