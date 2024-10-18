module WordInfo
  module Adjective
    module Parse
      module GrammaticalCases
        class MatchingWord < WordInfo::Adjective::Base
          delegate :items, :degree, :number, :gender, :grammatical_case, to: :context

          def call
            return unless matching_item

            context.word = matching_item["word"]
          end

          private

          def matching_item
            @matching_item ||= items.find { |item| item["form"].match?(pattern) }
          end

          def pattern
            /\A#{NAME}:.*\b#{number}\b.*:.*\b#{grammatical_case}\b.*:.*\b#{gender}\b.*:.*\b#{degree}\b/
          end
        end
      end
    end
  end
end
