require "rails_helper"

RSpec.describe DynamoDb do
  let(:aws_credentials) { instance_double("Aws::Credentials") }
  let(:dynamodb_client) { instance_double("Aws::DynamoDB::Client") }

  before do
    allow(Aws::Credentials).to receive(:new).and_return(aws_credentials)
    allow(Aws::DynamoDB::Client).to receive(:new).and_return(dynamodb_client)
  end

  subject { described_class.client }

  describe ".client" do
    it "sets AWS credentials" do
      subject

      expect(Aws.config[:credentials]).to eq(aws_credentials)
    end

    it { is_expected.to eq(dynamodb_client) }
  end

  describe ".table" do
    let(:dynamodb_resource) { instance_double("Aws::DynamoDB::Resource") }
    let(:table_name) { "test_table" }
    let(:table) { instance_double("Aws::DynamoDB::Table") }

    before do
      allow(Aws::DynamoDB::Resource).to receive(:new).with(client: dynamodb_client).and_return(dynamodb_resource)
      allow(dynamodb_resource).to receive(:table).with(table_name).and_return(table)
    end

    subject { described_class.table(table_name) }

    it "sets AWS credentials" do
      subject

      expect(Aws.config[:credentials]).to eq(aws_credentials)
    end

    it { is_expected.to eq(table) }
  end
end
