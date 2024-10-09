module Word
  module Info
    module Verb
      module Finite
        module Parse
          module Persons
            class ParsedItemManager < Word::Info::Verb::Base
              delegate :processed_subitems, :number, to: :context

              def call
                context.parsed_item = matching_parsed_item || new_parsed_item
              end

              private

              def matching_parsed_item
                processed_subitems.find { |item| item_matches?(item) }
              end

              def new_parsed_item
                Word::Info::Verb::Finite::Parse::FiniteParser.call(number:, processed_subitems:)
                processed_subitems.last
              end

              def item_matches?(item)
                item.number.name == number
              end
            end
          end
        end
      end
    end
  end
end
