module Words
  module Nouns
    module Iterator
      include Constants

      def noun_iterator
        CLASSIC_NUMBERS_ORDER.each do |number|
          CLASSIC_CASES_ORDER.each do |grammatical_case|
            yield(number, grammatical_case)
          end
        end
      end
    end
  end
end
