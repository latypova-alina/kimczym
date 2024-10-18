module WordInfo
  module Verb
    module Finite
      module Parse
        module Persons
          class PersonsParser < WordInfo::Verb::Base
            delegate :items, :number, :processed_items, :person, :key_name, to: :context

            def call
              return unless word

              PersonWriter.call(item: find_or_create_parsed_item, parsed_person:)
            end

            private

            def parsed_person
              PersonParser.call(
                word:,
                number:,
                person:
              ).processed_word
            end

            def word
              @word ||= MatchingWord.call(
                number:,
                person:,
                items:
              ).word
            end

            def find_or_create_parsed_item
              ParsedItemManager.call(
                number:,
                person:,
                processed_items:,
                key_name:
              ).parsed_item
            end
          end
        end
      end
    end
  end
end
