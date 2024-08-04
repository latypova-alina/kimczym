require "rails_helper"

describe WordNotFoundError do
  describe "#message!" do
    subject { described_class.new.message }

    it { is_expected.to eq("Word not found") }
  end
end
