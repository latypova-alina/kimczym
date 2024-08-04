module Words
  module Pickers
    class WordFormsPicker
      include ApplicationHelper

      def self.call(*args)
        new(*args).call
      end

      def initialize(base_word)
        @base_word = base_word
      end

      def call
        db_items
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
