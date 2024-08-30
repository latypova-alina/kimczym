module Words
  module Builders
    module Adjectives
      class Formatter < Base

        def initialize(item)
          @item = item
        end

        def call
          "<strong>#{item.degree.translation} / #{item.number.translation} / #{item.gender.translation}</strong>\n\n" <<
          item.cases.map{ |grammatical_case| "<strong>#{grammatical_case.translation}</strong> #{grammatical_case.value}" }.join("\n")
        end

        private

        attr_reader :item
      end
    end
  end
end
