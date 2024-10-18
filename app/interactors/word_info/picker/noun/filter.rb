module WordInfo
  module Picker
    module Noun
      class Filter
        include Interactor

        delegate :form_name, :default_item, to: :context

        def call
          context.items.select! do |item|
            item["form"].split(":")[0] == form_name && matching_default_gender?(item)
          end
        end

        private

        def matching_default_gender?(item)
          item["form"].split(":").last.include?(default_gender)
        end

        def default_gender
          default_item["form"].split(":").last
        end
      end
    end
  end
end
