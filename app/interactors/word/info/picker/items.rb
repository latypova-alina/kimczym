module Word
  module Info
  	module Picker
  		class Items
        include Interactor, WordInfoHelper

        delegate :initial_word, to: :context
        
        def call
          context.items = retrieve_db_items
        end

        private

        def retrieve_db_items
          dynamodb.query(
            table_name: ENV["TABLE_NAME"],
            index_name: "base-index",
            key_condition_expression: "#base = :message",
            expression_attribute_names: { "#base" => "base" },
            expression_attribute_values: { ":message" => initial_word }
          ).items
        end
  		end
  	end
  end
end
