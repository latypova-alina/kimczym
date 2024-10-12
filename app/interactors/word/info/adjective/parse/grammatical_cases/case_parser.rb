module Word
  module Info
    module Adjective
      module Parse
        module GrammaticalCases
          class CaseParser < Word::Info::Adjective::Base
            delegate :word, :grammatical_case, :processed_word, to: :context

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
end
