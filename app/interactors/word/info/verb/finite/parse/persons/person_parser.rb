module Word
  module Info
    module Verb
      module Finite
        module Parse
          module Persons
            class PersonParser < Word::Info::Verb::Base
              delegate :word, :person, :processed_word, to: :context

              def call
                context.processed_word = OpenStruct.new(
                  name: person,
                  value: word
                )
              end
            end
          end
        end
      end
    end
  end
end
