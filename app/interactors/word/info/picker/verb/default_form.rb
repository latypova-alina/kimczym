module Word
  module Info
    module Picker
      module Verb
        class DefaultForm
          include Interactor

          def call
            context.default_form = nil
          end
        end
      end
    end
  end
end
