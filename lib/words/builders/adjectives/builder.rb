module Words
  module Builders
    module Adjectives
      class Builder < Base
        def initialize(items)
          super()
          @items = items
          @result = []
        end

        def call
          build_result

          result
        end

        private

        def build_result
          CLASSIC_DEGREE_ORDER.each do |degree|
            CLASSIC_NUMBERS_ORDER.each do |number|
              CLASSIC_GENDER_ORDER.each do |gender|
                CasesProcessor.call(items, degree, number, gender, result)
              end
            end
          end

          format_result_items
        end

        def format_result_items
          result.each { |item| item.formatted_text = Formatter.call(result, item) }
        end

        attr_reader :items
        attr_accessor :result
      end
    end
  end
end
