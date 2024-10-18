module WordInfo
  module Noun
    module Format
      class Heading < WordInfo::Noun::Base
        delegate :item, to: :context

        def call
          context.heading = heading
        end

        private

        def heading
          "<strong>#{I18n.t("shared.#{item.number}")}</strong>\n\n"
        end
      end
    end
  end
end
