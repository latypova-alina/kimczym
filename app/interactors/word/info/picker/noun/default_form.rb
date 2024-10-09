module Word
  module Info
    module Picker
      module Noun
        class DefaultForm
          include Interactor

          delegate :splitted_form, to: :context

          def call
            context.default_form = key_name
          end

          private

          def key_name
            splitted_form[1]
          end
        end
      end
    end
  end
end
