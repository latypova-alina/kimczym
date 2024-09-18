module Word
  module Info
    module Adjective
      module Parse
        module GrammaticalCases
          class CasesParser < Word::Info::Adjective::Base
            delegate :items, :degree, :number, :gender, :processed_items, :grammatical_case, to: :context

            def call
              return unless word

              CaseWriter.call(item: find_or_create_parsed_item, parsed_case:)
            end

            private

            def add_case_to_item(item)
              item.cases ||= []
              item.cases << parsed_case
            end

            def parsed_case
              CaseParser.call(
                word:, 
                number:, 
                gender:, 
                grammatical_case:
              ).processed_word
            end

            def word
              @word ||= MatchingWord.call(
                degree:, 
                number:, 
                gender:, 
                grammatical_case:, 
                items:
              ).word
            end

            def find_or_create_parsed_item
              ParsedItemManager.call(
                degree:, 
                number:, 
                gender:, 
                grammatical_case:, 
                processed_items:
              ).parsed_item
            end
          end
        end
      end
    end
  end
end
