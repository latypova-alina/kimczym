module Word
  module Info
    class Formatter < Base
      FORMATTER_CLASSES = {
        "adj" => Adjective::Formatter,
        "subst" => Noun::Formatter
      }.freeze

      def call
        super()
        corresponding_class.call(processed_items:)
      end

      private

      def corresponding_class
        FORMATTER_CLASSES[form_name]
      end
    end
  end
end
