module Words
  module Builders
    module Adjectives
      class SearchWord < Base
        def initialize(degree, number, gender, grammatical_case, items)
          super()
          @degree = degree
          @number = number
          @gender = gender
          @grammatical_case = grammatical_case
          @items = items
        end

        def call
          return unless matching_item

          matching_item["word"]
        end

        private

        def matching_item
          @matching_item ||= items.find { |item| item["form"].match?(pattern) }
        end

        def pattern
          /\A#{NAME}:.*\b#{number}\b.*:.*\b#{grammatical_case}\b.*:.*\b#{gender}\b.*:.*\b#{degree}\b/
        end

        attr_reader :degree, :number, :gender, :items, :grammatical_case
      end
    end
  end
end
