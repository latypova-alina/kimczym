module WordInfo
  module Picker
    module Verb
      class DefaultForm
        include Interactor

        DEFAULT_FORM = "fin.sg".freeze

        def call
          context.default_form = DEFAULT_FORM
        end
      end
    end
  end
end
