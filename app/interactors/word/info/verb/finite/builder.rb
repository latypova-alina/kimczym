module Word
  module Info
    module Verb
      module Finite
        class Builder < Word::Info::Verb::Base
          delegate :items, :processed_subitems, to: :context

          def call
            fin_iterator do |number, person|
              Parse::Persons::PersonsParser.call(
                items:,
                processed_subitems:,
                number:,
                person:
              )
            end
          end
        end
      end
    end
  end
end
