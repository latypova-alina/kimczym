module Word
  module Info
    module Noun
      module Parse
        module GrammaticalCases
          class CasesParser < Word::Info::Noun::Base
            delegate :items, :number, :processed_items, :grammatical_case, to: :context

            def call
              return unless word

              CaseWriter.call(item: find_or_create_parsed_item, parsed_case:)
            end

            private

            def parsed_case
              CaseParser.call(
                word:,
                number:,
                grammatical_case:
              ).processed_word
            end

            def word
              @word ||= MatchingWord.call(
                number:,
                grammatical_case:,
                items:
              ).word
            end

            def find_or_create_parsed_item
              ParsedItemManager.call(
                number:,
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
