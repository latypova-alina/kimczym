module Word
  module Info
    module Noun
      module Parse
        module GrammaticalCases
          class ParsedItemManager < Word::Info::Noun::Base
            delegate :processed_items, :number, to: :context

            def call
              context.parsed_item = matching_parsed_item || new_parsed_item
            end

            private

            def matching_parsed_item
              processed_items.find { |item| item_matches?(item) }
            end

            def new_parsed_item
              Word::Info::Noun::Parse::NounParser.call(number:, processed_items:)
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
