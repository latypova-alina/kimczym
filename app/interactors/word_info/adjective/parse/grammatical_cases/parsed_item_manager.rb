module WordInfo
  module Adjective
    module Parse
      module GrammaticalCases
        class ParsedItemManager < WordInfo::Adjective::Base
          delegate :processed_items, :degree, :number, :gender, to: :context

          def call
            context.parsed_item = matching_parsed_item || new_parsed_item
          end

          private

          def matching_parsed_item
            processed_items.find { |item| item_matches?(item) }
          end

          def new_parsed_item
            WordInfo::Adjective::Parse::AdjectiveParser.call(degree:, number:, gender:, processed_items:)
            processed_items.last
          end

          def item_matches?(item)
            item.degree == degree && item.number == number && item.gender == gender
          end
        end
      end
    end
  end
end
