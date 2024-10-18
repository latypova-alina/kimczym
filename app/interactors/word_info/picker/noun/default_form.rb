module WordInfo
  module Picker
    module Noun
      class DefaultForm
        include Interactor

        delegate :items, :initial_item, :splitted_base_form, to: :context

        def call
          context.default_item = default_item
          context.default_form = key_name
        end

        private

        def key_name
          splitted_default_form[1]
        end

        def splitted_default_form
          default_item["form"].split(":")
        end

        def default_item
          items.select do |item|
            item["word"] == initial_item["word"] && item["form"].split(":")[0] == splitted_base_form[0]
          end.first
        end
      end
    end
  end
end
