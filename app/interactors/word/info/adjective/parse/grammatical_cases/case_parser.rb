module Word
  module Info
    module Adjective
      module Parse
        module GrammaticalCases
          class CaseParser < Word::Info::Adjective::Base
            delegate :word, :number, :gender, :grammatical_case, :processed_word, to: :context

            def call
              context.processed_word = OpenStruct.new(
                name: grammatical_case,
                value: word,
                translation:
              )
            end

            private

            def translation
              I18n.t("#{NAME}.#{number}.#{GENDER_TRANSLATION_KEYS[number][gender]}.#{grammatical_case}")
            end
          end
        end
      end
    end
  end
end
