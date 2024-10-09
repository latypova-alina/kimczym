module Words
  module Verbs
    module Iterator
      include Constants

      def common_iterator(&block)
        ["fin"].each(&block)
      end

      def fin_iterator
        CLASSIC_NUMBERS_ORDER.each do |number|
          CLASSIC_PERSON_ORDER.each do |person|
            yield(number, person)
          end
        end
      end
    end
  end
end
