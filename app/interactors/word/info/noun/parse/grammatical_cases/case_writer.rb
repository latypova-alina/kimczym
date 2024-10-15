module Word
  module Info
    module Noun
      module Parse
        module GrammaticalCases
          class CaseWriter < Word::Info::Noun::Base
            delegate :parsed_case, :item, to: :context

            def call
              item.send("#{parsed_case.name}=", parsed_case.value)
            end
          end
        end
      end
    end
  end
end
