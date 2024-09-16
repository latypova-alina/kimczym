module Word
  module Info
  	module Picker
  		class InitialWord
  			include Interactor, WordInfoHelper

  			delegate :message, to: :context

        def call
          context.fail! if initial_item.nil?

          context.initial_word = initial_item["base"]
        end

        private

        def initial_item
          db_items.max_by { |item| item["book_weight"] }
        end

        def db_items
          dynamodb.query(
            table_name: ENV["TABLE_NAME"],
            key_condition_expression: "word = :message",
            expression_attribute_values: { ":message" => message }
          ).items
        end
  		end
  	end
  end
end
