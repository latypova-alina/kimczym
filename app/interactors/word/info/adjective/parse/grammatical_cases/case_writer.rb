module Word
  module Info
    module Adjective
      module Parse
        module GrammaticalCases
          class CaseWriter < Word::Info::Adjective::Base
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
