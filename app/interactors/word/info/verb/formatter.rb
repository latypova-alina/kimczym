module Word
  module Info
    module Verb
      class Formatter < Base
        FORMATTER_CLASSES = {
          "fin" => Finite::Formatter
        }.freeze

        delegate :processed_items, to: :context

        def call
          processed_items.each do |verb_form_item|
            FORMATTER_CLASSES[verb_form_item.name].call(processed_items: verb_form_item.processed_items)
          end
        end
      end
    end
  end
end
