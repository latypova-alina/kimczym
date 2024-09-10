module Words
  module Builders
    module Adjectives
      class Builder < Base
        def initialize(items)
          super()
          @items = items
          @result = []
        end

        def call
          build_result

          result
        end

        private

        def build_result
          CLASSIC_DEGREE_ORDER.each do |degree|
            CLASSIC_NUMBERS_ORDER.each do |number|
              CLASSIC_GENDER_ORDER.each do |gender|
                CLASSIC_CASES_ORDER.map do |grammatical_case|
                  word = SearchWord.call(degree, number, gender, grammatical_case, items)
                  next unless word

                  existing_item = matching_parsed_item(degree, number, gender)
                  parsed_item = existing_item || Parser.call(degree, number, gender)
                  parsed_item.cases ||= []
                  parsed_item.cases << CaseParser.call(word, number, gender, grammatical_case)
                  result << parsed_item unless existing_item
                end
              end
            end
          end

          result.each { |item| item.formatted_text = Formatter.call(result, item) }
        end

        def matching_parsed_item(degree, number, gender)
          result.find { |item| item.degree.name == degree && item.number.name == number && item.gender.name == gender }
        end

        attr_reader :items
        attr_accessor :result
      end
    end
  end
end
