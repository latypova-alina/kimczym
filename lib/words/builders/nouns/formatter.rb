module Words
  module Builders
    module Nouns
      class Formatter < Base
        def initialize(items)
          super(items)
          @result = ""
        end

        private

        def build_result
          items.each do |number_key, value|
            result << "\n<strong>#{number_key}</strong>\n\n" unless value.blank?
            value.each do |grammatical_case, word|
              result << "<strong>#{grammatical_case}</strong> #{word}\n"
            end
          end
        end
      end
    end
  end
end
