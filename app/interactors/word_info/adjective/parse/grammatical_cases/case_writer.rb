module WordInfo
  module Adjective
    module Parse
      module GrammaticalCases
        class CaseWriter < WordInfo::Adjective::Base
          delegate :parsed_case, :item, to: :context

          def call
            item.send("#{parsed_case.name}=", parsed_case.value)
          end
        end
      end
    end
  end
end
