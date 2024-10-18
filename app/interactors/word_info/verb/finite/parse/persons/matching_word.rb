module WordInfo
  module Verb
    module Finite
      module Parse
        module Persons
          class MatchingWord < WordInfo::Verb::Base
            delegate :items, :number, :person, to: :context

            def call
              return unless matching_item

              context.word = matching_item["word"]
            end

            private

            def matching_item
              @matching_item ||= items.find { |item| item["form"].match?(pattern) }
            end

            def pattern
              /\A#{FINITE_NAME}:.*\b#{number}\b.*:.*\b#{person}\b.*:.*\b/
            end
          end
        end
      end
    end
  end
end
