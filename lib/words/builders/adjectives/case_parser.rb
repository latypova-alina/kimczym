module Words
  module Builders
    module Adjectives
      class CaseParser < Base
        def initialize(word, number, gender, grammatical_case)
          super()
          @word = word
          @number = number
          @gender = gender
          @grammatical_case = grammatical_case
        end

        def call
          OpenStruct.new(
            name: grammatical_case,
            value: word,
            translation: I18n.t("#{NAME}.#{number}.#{GENDER_TRANSLATION_KEYS[number][gender]}.#{grammatical_case}")
          )
        end

        private

        attr_reader :word, :number, :gender, :grammatical_case
      end
    end
  end
end
