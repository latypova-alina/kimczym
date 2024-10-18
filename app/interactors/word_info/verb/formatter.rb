module WordInfo
  module Verb
    class Formatter < Base
      FORMATTER_CLASSES = {
        "fin" => Finite::Formatter
      }.freeze

      delegate :processed_items, to: :context

      def call
        processed_items.each do |verb_form_item|
          verb_form_item.formatted_text = processed_subitems(verb_form_item).map(&:formatted_text).join("\n\n")
        end
      end

      private

      def processed_subitems(verb_form_item)
        FORMATTER_CLASSES[verb_form_item.name].call(processed_items: verb_form_item.processed_items).processed_items
      end
    end
  end
end
