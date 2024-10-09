module Word
  module Info
    module Picker
      module Adjective
        class Filter < Base
          include Interactor

          delegate :base_item, :form_name, to: :context

          def call
            context.items.select! do |item|
              item["form"].split(":")[0] == form_name
            end
          end
        end
      end
    end
  end
end
