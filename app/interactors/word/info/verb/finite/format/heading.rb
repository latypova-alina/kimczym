module Word
  module Info
    module Verb
      module Finite
        module Format
          class Heading < Word::Info::Verb::Base
            delegate :item, to: :context

            def call
              context.heading = heading
            end

            private

            def heading
              "<strong>#{verb_form_translation} / #{number_translation}</strong>\n\n"
            end

            def number_translation
              I18n.t("shared.#{item.number}")
            end

            def verb_form_translation
              I18n.t("#{NAME}.#{FINITE_NAME}.name")
            end
          end
        end
      end
    end
  end
end
