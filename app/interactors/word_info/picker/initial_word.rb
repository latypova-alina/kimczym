module WordInfo
  module Picker
    class InitialWord
      include WordInfoHelper
      include Interactor

      delegate :message, to: :context

      def call
        raise ::WordNotFoundError if initial_item.nil?

        context.initial_word = initial_item["base"]
        context.initial_item = initial_item
      end

      private

      def initial_item
        db_items.max_by { |item| item["book_weight"] }
      end

      def db_items
        dynamodb.query(
          table_name: ENV["TABLE_NAME"],
          key_condition_expression: "word = :message",
          expression_attribute_values: { ":message" => message.downcase }
        ).items
      end
    end
  end
end
