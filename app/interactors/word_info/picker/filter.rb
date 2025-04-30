module WordInfo
  module Picker
    class Filter
      include Interactor

      FILTER_CLASSES = {
        "adj" => Adjective::Filter,
        "subst" => Noun::Filter
      }.freeze

      delegate :items, :base_item, :form_name, :default_item, to: :context

      def call
        context.form_name ||= base_item["form"].split(":")[0]

        corresponding_class&.call(items:, form_name:)
      end

      private

      def corresponding_class
        FILTER_CLASSES[form_name]
      end
    end
  end
end
