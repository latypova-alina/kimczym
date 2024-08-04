require "rails_helper"

RSpec.describe ErrorHandlers::WordNotFoundHandler do
  describe ".text" do
    subject { described_class.text }

    it { is_expected.to eq("The word was not found :(") }
  end

  describe ".image" do
    let(:images) do
      [
        "https://media3.giphy.com/media/1.gif",
        "https://media2.giphy.com/media/2.gif",
        "https://media2.giphy.com/media/3.gif",
        "https://media4.giphy.com/media/4.gif",
        "https://media2.giphy.com/media/5.gif"
      ]
    end

    before { stub_const("ErrorHandlers::WordNotFoundHandler::IMAGES", images) }

    subject { described_class.image }

    it "returns one of the images" do
      expect(images).to include(subject)
    end
  end
end
