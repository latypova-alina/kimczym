module Word
  module Info
    module Noun
      module Parse
        module GrammaticalCases
          class CaseWriter < Word::Info::Noun::Base
            delegate :parsed_case, :item, to: :context

            def call
              item.cases ||= []
              item.cases << parsed_case
            end
          end
        end
      end
    end
  end
end
