module Word
  module Info
    module Picker
      class DefaultForm
        include Interactor

        delegate :initial_item, to: :context

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

        def splitted_form
          @splitted_form ||= initial_item["form"].split(":")
        end
      end
    end
  end
end
