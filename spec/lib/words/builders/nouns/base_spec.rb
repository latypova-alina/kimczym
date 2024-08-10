require "rails_helper"

describe Words::Builders::Nouns::Base do
  let(:base_class_instance) { described_class.call([]) }

  describe "#build_result" do
    it "raises NotImplementedError if not implemented in subclass" do
      expect { base_class_instance.send(:build_result) }.to raise_error(NotImplementedError)
    end
  end
end
