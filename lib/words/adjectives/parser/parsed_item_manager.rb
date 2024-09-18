module Words
  module Adjectives
    module Parser
      class ParsedItemManager
        def self.find_or_create(*args)
          new(*args).call
        end

        def initialize(processed_items, degree, number, gender)
          @processed_items = processed_items
          @degree = degree
          @number = number
          @gender = gender
        end

        def call
          find_matching || create_new
        end

        private

        def find_matching
          processed_items.find { |item| item_matches?(item, degree, number, gender) }
        end

        def create_new
          Word::Info::Adjective::Parse::AdjectiveParser.call(degree:, number:, gender:, processed_items:)
          processed_items.last
        end

        private

        def self.item_matches?(item, degree, number, gender)
          item.degree.name == degree && item.number.name == number && item.gender.name == gender
        end
      end
    end
  end
end
