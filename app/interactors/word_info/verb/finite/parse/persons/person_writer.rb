module WordInfo
  module Verb
    module Finite
      module Parse
        module Persons
          class PersonWriter < WordInfo::Verb::Base
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
