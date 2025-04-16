module WordInfo
  module Adjective
    module Parse
      module GrammaticalCases
        class CaseParser < WordInfo::Adjective::Base
          delegate :word, :grammatical_case, to: :context

          def call
            context.processed_word = OpenStruct.new(
              name: grammatical_case,
              value: word
            )
          end
        end
      end
    end
  end
end
