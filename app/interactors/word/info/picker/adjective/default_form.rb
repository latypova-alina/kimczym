module Word
  module Info
    module Picker
      module Adjective
        class DefaultForm
          include Interactor

          delegate :splitted_form, to: :context

          def call
            context.default_form = key_name
          end

          private

          def key_name
            number = splitted_form[1]
            gender = splitted_form[3]
            degree = splitted_form[4]

            [number, gender, degree].join(".")
          end
        end
      end
    end
  end
end
