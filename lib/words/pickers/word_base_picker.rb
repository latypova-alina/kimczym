module Words
  module Pickers
    class WordBasePicker
      include ApplicationHelper

      def self.call(*args)
        new(*args).call
      end

      def initialize(message)
        @message = message
      end

      def call
        raise ::WordNotFoundError if base_item.nil?

        base_item["base"]
      end

      private

      def base_item
        db_items.min_by { |item| -item["book_weight"] }
      end

      def db_items
        dynamodb.query(
          table_name: ENV["TABLE_NAME"],
          key_condition_expression: "word = :message",
          expression_attribute_values: { ":message" => message }
        ).items
      end

      attr_reader :message
    end
  end
end
