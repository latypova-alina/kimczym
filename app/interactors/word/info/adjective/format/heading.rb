module Word
  module Info
    module Adjective
      module Format
        class Heading < Word::Info::Adjective::Base
          delegate :item, to: :context

          def call
            context.heading = heading
          end

          private

          def heading
            "<strong>#{degree_translation} / #{number_translation} / #{gender_translation}</strong>\n\n"
          end

          def degree_translation
            I18n.t("#{NAME}.#{item.degree}")
          end

          def number_translation
            I18n.t("shared.#{item.number}")
          end

          def gender_translation
            I18n.t("shared.#{item.gender}")
          end
        end
      end
    end
  end
end
