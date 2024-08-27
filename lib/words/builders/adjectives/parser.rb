module Words
  module Builders
    module Adjectives
      class Parser < Base
        CLASSIC_DEGREE_ORDER = %w[pos com sup]
        CLASSIC_CASES_ORDER = %w[nom gen dat acc inst loc voc].freeze
        CLASSIC_GENDER_ORDER = %w[m1 m2 m3 f n].freeze
        CLASSIC_NUMBERS_ORDER = %w[sg pl].freeze

        private

        def build_result          
          CLASSIC_DEGREE_ORDER.each do |degree|
            result[degree] ||= {}
          
            CLASSIC_NUMBERS_ORDER.each do |number|
              result[degree][number] ||= {}
          
              CLASSIC_GENDER_ORDER.each do |gender|
                result[degree][number][gender] ||= {}
          
                CLASSIC_CASES_ORDER.each do |grammatical_case|
                  result[degree][number][gender][grammatical_case] ||= {}

                  pattern = /\A#{NAME}:.*\b#{number}\b.*:.*\b#{grammatical_case}\b.*:.*\b#{gender}\b.*:.*\b#{degree}\b/

                  item = matching_item(pattern)

                  next unless item

                  result[degree][number][gender][grammatical_case] = item["word"]
                end
              end
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
