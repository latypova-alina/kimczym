module WordInfo
  module Picker
    class BaseItem
      include Interactor

      delegate :items, to: :context

      def call
        context.base_item = items
                            .select { |item| item["word"] == item["base"] }
                            .max_by { |item| item["book_weight"] }
      end
    end
  end
end
