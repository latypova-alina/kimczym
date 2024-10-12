module Word
  module Info
    module Verb
      module Finite
        module Parse
          class FiniteParser < Word::Info::Verb::Base
            delegate :number, :processed_subitems, to: :context

            def call
              processed_subitems << OpenStruct.new(
                number: number_object,
                key_name: number
              )
            end

            private

            def number_object
              OpenStruct.new(name: number, translation: I18n.t("shared.#{number}"))
            end
          end
        end
      end
    end
  end
end
