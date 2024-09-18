module Word
  module Info
    module Adjective
      module Parse
        module GrammaticalCases
          class ParsedItemManager < Word::Info::Adjective::Base
            delegate :processed_items, :degree, :number, :gender, to: :context

            def call
              context.parsed_item = matching_parsed_item || new_parsed_item
            end

            private

            def matching_parsed_item
              processed_items.find { |item| item_matches?(item) }
            end

            def new_parsed_item
              Word::Info::Adjective::Parse::AdjectiveParser.call(degree:, number:, gender:, processed_items:)
              processed_items.last
            end

            def item_matches?(item)
              item.degree.name == degree && item.number.name == number && item.gender.name == gender
            end
          end
        end
      end
    end
  end
end
