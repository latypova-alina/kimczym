module Word
  module Info
    class Builder < Base
      BUILDER_CLASSES = { "adj" => Adjective::Builder }.freeze

      def call
        super()
        filter_items
        corresponding_class.call(items:, processed_items:)
      end

      private

      def corresponding_class
        BUILDER_CLASSES[form_name]
      end

      def filter_items
        context.items.select! { |item| item["form"].split(":")[0] == form_name }
      end
    end
  end
end
