module Word
  module Info
    module Noun
      module Parse
        module GrammaticalCases
          class CaseParser < Word::Info::Noun::Base
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
