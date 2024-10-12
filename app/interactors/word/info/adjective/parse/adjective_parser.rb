module Word
  module Info
    module Adjective
      module Parse
        class AdjectiveParser < Word::Info::Adjective::Base
          delegate :degree, :number, :gender, :processed_items, to: :context

          def call
            processed_items << ::Adjective.new(number:, degree:, gender:, key_name:)
          end

          private

          def key_name
            [number, gender, degree].join(".")
          end
        end
      end
    end
  end
end
