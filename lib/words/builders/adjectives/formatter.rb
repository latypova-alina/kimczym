module Words
  module Builders
    module Adjectives
      class Formatter < Base
        def initialize(items)
          super(items)
        end

        private

        def build_result
          items.each do |degree, numbers|
            result[degree] ||= ""
            result[degree] << "\n<strong>#{degree}</strong>\n\n" unless numbers.blank?
            
            numbers.each do |number, genders|
              result[degree] << "\n<strong>#{number}</strong>\n" unless genders.blank?

              genders.each do |gender, grammatical_cases|
                result[degree] << "\n<strong>#{gender}</strong>\n" unless grammatical_cases.blank?

                grammatical_cases.each do |grammatical_case, word|
                  result[degree] << "<strong>#{grammatical_case}</strong> #{word}\n"
                end
              end
            end
          end
        end
      end
    end
  end
end
