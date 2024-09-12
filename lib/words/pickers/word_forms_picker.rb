module Words
  module Pickers
    class WordFormsPicker
      include ApplicationHelper

      def initialize(base_word)
        @base_word = base_word
      end

      def word_forms_items
        db_items
      end

      def base_item
        db_items
          .select { |item| item["word"] == item["base"] }
          .max_by { |item| item["book_weight"] }
      end

      private

      def db_items
        dynamodb.query(
          table_name: ENV["TABLE_NAME"],
          index_name: "base-index",
          key_condition_expression: "#base = :message",
          expression_attribute_names: { "#base" => "base" },
          expression_attribute_values: { ":message" => base_word }
        ).items
      end

      attr_reader :base_word
    end
  end
end
