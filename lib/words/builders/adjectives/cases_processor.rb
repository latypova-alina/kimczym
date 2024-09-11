module Words
  module Builders
    module Adjectives
      class CasesProcessor < Base
        def initialize(items, degree, number, gender, result)
          super()
          @items = items
          @degree = degree
          @number = number
          @gender = gender
          @result = result
        end

        def call
          CLASSIC_CASES_ORDER.each { |grammatical_case| process_case(grammatical_case) }
        end

        private

        def process_case(grammatical_case)
          word = SearchWord.call(degree, number, gender, grammatical_case, items)
          return unless word

          find_or_create_parsed_item.tap do |item|
            item.cases ||= []
            item.cases << CaseParser.call(word, number, gender, grammatical_case)
          end
        end

        def find_or_create_parsed_item
          matching_parsed_item || new_parsed_item
        end

        def new_parsed_item
          result << Parser.call(degree, number, gender)
          result.last
        end

        def matching_parsed_item
          result.find { |item| item.degree.name == degree && item.number.name == number && item.gender.name == gender }
        end

        attr_reader :items, :number, :gender, :degree
        attr_accessor :result
      end
    end
  end
end
