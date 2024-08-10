module Words
  module Builders
    module Nouns
      class Parser < Base
        CLASSIC_CASES_ORDER = %w[nom gen dat acc inst loc voc].freeze
        CLASSIC_NUMBERS_ORDER = %w[sg pl].freeze

        private

        def build_result
          result[NAME] ||= {}

          CLASSIC_NUMBERS_ORDER.each do |number|
            result[NAME][number] ||= {}

            CLASSIC_CASES_ORDER.each do |grammatical_case|
              pattern = /\A#{NAME}:#{number}:.*\b#{grammatical_case}\b/

              item = matching_item(pattern)

              next unless item

              result[NAME][number][grammatical_case] = item["word"]
            end
          end
        end

        def matching_item(pattern)
          items.find { |item| item["form"].match?(pattern) }
        end
      end
    end
  end
end
