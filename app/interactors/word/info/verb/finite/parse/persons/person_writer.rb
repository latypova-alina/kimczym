module Word
  module Info
    module Verb
      module Finite
        module Parse
          module Persons
            class PersonWriter < Word::Info::Verb::Base
              delegate :parsed_person, :item, to: :context

              def call
                item.send("#{parsed_person.name}=", parsed_person.value)
              end
            end
          end
        end
      end
    end
  end
end
