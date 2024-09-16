module Word
  module Info
    module Adjective
      module Parse
        module GrammaticalCases
          class CasesParser < Word::Info::Adjective::Base
            delegate :items, :degree, :number, :gender, :processed_items, to: :context

            def call
              CLASSIC_CASES_ORDER.each { |grammatical_case| process_case(grammatical_case) }
            end

            private

            def process_case(grammatical_case)
              word = MatchingWord.call(degree:, number:, gender:, grammatical_case:, items:).word
              return unless word

              find_or_create_parsed_item.tap do |item|
                item.cases ||= []
                item.cases << CaseParser.call(word:, number:, gender:, grammatical_case:).processed_word
              end
            end

            def find_or_create_parsed_item
              matching_parsed_item || new_parsed_item
            end

            def new_parsed_item
              Word::Info::Adjective::Parse::AdjectiveParser.call(degree:, number:, gender:, processed_items:)
              processed_items.last
            end

            def matching_parsed_item
              processed_items.find { |item| item.degree.name == degree && item.number.name == number && item.gender.name == gender }
            end
          end
        end
      end
    end
  end
end
