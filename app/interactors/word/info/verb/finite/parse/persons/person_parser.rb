module Word
  module Info
    module Verb
      module Finite
        module Parse
          module Persons
            class PersonParser < Word::Info::Verb::Base
              delegate :word, :person, :processed_word, :number, to: :context

              def call
                context.processed_word = OpenStruct.new(
                  name: person,
                  value: word,
                  key_name:,
                  translation:
                )
              end

              private

              def translation
                I18n.t([NAME, key_name].join("."))
              end

              def key_name
                @key_name ||= "#{FINITE_NAME}.#{number}.#{person}"
              end
            end
          end
        end
      end
    end
  end
end
