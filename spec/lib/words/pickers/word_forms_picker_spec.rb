require "rails_helper"

describe Words::Pickers::WordFormsPicker do
  let(:base_word) { "example" }
  let(:dynamodb) { double("DynamoDBClient") }
  let(:table_name) { "test_table" }
  let(:db_items) do
    [
      { "word" => "example", "base" => "example", "book_weight" => 5 },
      { "word" => "examples", "base" => "example", "book_weight" => 3 },
      { "word" => "exampled", "base" => "example", "book_weight" => 2 },
      { "word" => "exemplary", "base" => "example", "book_weight" => 1 }
    ]
  end

  before do
    allow_any_instance_of(described_class).to receive(:dynamodb).and_return(dynamodb)

    allow(dynamodb).to receive(:query).and_return(double("result", items: db_items))
  end

  subject { described_class.new(base_word) }

  describe "#word_forms_items" do
    subject { super().word_forms_items }

    it { is_expected.to eq(db_items) }
  end

  describe "#base_item" do
    subject { super().base_item }

    it { is_expected.to eq({ "word" => "example", "base" => "example", "book_weight" => 5 }) }

    context "when there are no items where word equals to base" do
      let(:db_items) do
        [
          { "word" => "smth", "base" => "example", "book_weight" => 5 },
          { "word" => "examples", "base" => "example", "book_weight" => 3 }
        ]
      end

      it { is_expected.to be_nil }
    end
  end
end
