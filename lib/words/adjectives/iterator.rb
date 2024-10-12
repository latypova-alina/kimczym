module Words
  module Adjectives
    module Iterator
      include Constants

      def adjective_iterator
        CLASSIC_DEGREE_ORDER.each do |degree|
          CLASSIC_NUMBERS_ORDER.each do |number|
            CLASSIC_GENDER_ORDER.each do |gender|
              CLASSIC_CASES_ORDER.each do |grammatical_case|
                yield(degree, number, gender, grammatical_case)
              end
            end
          end
        end
      end
    end
  end
end
