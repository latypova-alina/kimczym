require "rails_helper"

describe Words::Pickers::WordBasePicker do
  let(:message) { "test_message" }
  let(:dynamodb) { instance_double(Aws::DynamoDB::Client) }
  let(:db_response) { instance_double(Aws::DynamoDB::Types::QueryOutput, items: db_items) }

  before do
    allow_any_instance_of(Words::Pickers::WordBasePicker).to receive(:dynamodb).and_return(dynamodb)
    allow(dynamodb).to receive(:query).and_return(db_response)
  end

  describe ".call" do
    subject { described_class.call(message) }

    context "when base_item is found" do
      let(:db_items) do
        [
          {
            "base" => "word_base",
            "book_weight" => 10
          },
          {
            "base" => "another_base",
            "book_weight" => 5
          }
        ]
      end

      it "returns the base_item with the highest book_weight" do
        expect(subject).to eq("word_base")
      end
    end

    context "when base_item is not found" do
      let(:db_items) { [] }

      it "raises WordNotFoundError" do
        expect { subject }.to raise_error(WordNotFoundError)
      end
    end
  end
end
