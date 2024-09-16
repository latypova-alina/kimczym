module Word
	module Info
    module Adjective
      class Builder < Base
        delegate :items, :processed_items, to: :context

        def call
          CLASSIC_DEGREE_ORDER.each do |degree|
            CLASSIC_NUMBERS_ORDER.each do |number|
              CLASSIC_GENDER_ORDER.each do |gender|
                #todo think about constructor which will also include formatting
                Parse::GrammaticalCases::CasesParser.call(items:, degree:, number:, gender:, processed_items:)
              end
            end
          end
        end
  		end
  	end
  end
end
