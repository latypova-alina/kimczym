module Word
  module Info
    module Verb
      class Builder < Base
        BUILDER_CLASSES = {
          "fin" => Finite::Builder
        }.freeze

        delegate :items, :processed_items, to: :context

        def call
          common_iterator do |verb_form|
            context.processed_items << OpenStruct.new(
              name: verb_form,
              translation: translation(verb_form),
              buttons: buttons(verb_form),
              processed_items: verb_form_processed_items(verb_form)
            )
          end
        end

        private

        def translation(verb_form)
          I18n.t([NAME, verb_form, "name"].join("."))
        end

        def buttons(verb_form)
          Buttons::Builder.call(verb_form:).buttons
        end

        def verb_form_processed_items(verb_form)
          BUILDER_CLASSES[verb_form].call(items:, processed_subitems: []).processed_subitems
        end
      end
    end
  end
end
