module WordInfo
  module Verb
    module Finite
      module Parse
        module Persons
          class ParsedItemManager < WordInfo::Verb::Base
            delegate :processed_items, :number, :key_name, to: :context

            def call
              context.parsed_item = matching_parsed_item || new_parsed_item
            end

            private

            def matching_parsed_item
              processed_items.find { |item| item_matches?(item) }
            end

            def new_parsed_item
              WordInfo::Verb::Finite::Parse::FiniteParser.call(number:, processed_items:, key_name:)
              processed_items.last
            end

            def item_matches?(item)
              item.number == number
            end
          end
        end
      end
    end
  end
end
