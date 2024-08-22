module Words
  module Builders
    class WordFormsBuilder
      BUILDER_CLASSES = {
        "subst" => Nouns::Builder,
        "adj" => Adjectives::Builder
      }.freeze

      def self.call(*args)
        new(*args).call
      end

      def initialize(base_item, items)
        @base_item = base_item
        @items = items
      end

      def call
        raise ::WordNotFoundError if BUILDER_CLASSES[form_name].nil?

        BUILDER_CLASSES[form_name].call(filtered_items)
      end

      private

      def filtered_items
        items.select { |item| item["form"].split(":")[0] == form_name }
      end

      def form_name
        @form_name ||= base_item["form"].split(":")[0]
      end

      attr_reader :items, :base_item
    end
  end
end
