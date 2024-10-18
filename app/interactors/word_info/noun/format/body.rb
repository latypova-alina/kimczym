module WordInfo
  module Noun
    module Format
      class Body < WordInfo::Noun::Base
        delegate :item, to: :context

        def call
          context.body = body
        end

        private

        def body
          CLASSIC_CASES_ORDER.map do |grammatical_case|
            grammatical_case_value = item.send(grammatical_case)

            "<strong>#{I18n.t("#{NAME}.#{grammatical_case}")}</strong> #{grammatical_case_value}"
          end.join("\n")
        end
      end
    end
  end
end
