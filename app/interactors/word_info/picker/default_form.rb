module WordInfo
  module Picker
    class DefaultForm
      include Interactor

      PICKER_CLASSES = {
        "adj" => Adjective::DefaultForm,
        "subst" => Noun::DefaultForm,
        "inf" => Verb::DefaultForm,
        "fin" => Verb::DefaultForm
      }.freeze

      delegate :base_item, :initial_item, :items, to: :context

      def call
        context.default_item = picker.default_item
        context.default_form = picker.default_form
      end

      private

      def picker
        PICKER_CLASSES[splitted_base_form[0]].call(items:, initial_item:, splitted_base_form:)
      end

      def splitted_base_form
        @splitted_base_form ||= base_item["form"].split(":")
      end
    end
  end
end
