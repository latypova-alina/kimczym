module Word
  module Info
    module Picker
      module Verb
        class DefaultForm
          include Interactor

          delegate :splitted_form, to: :context

          def call
            context.default_form = key_name
          end

          private

          def key_name
            splitted_form[0]
          end
        end
      end
    end
  end
end
