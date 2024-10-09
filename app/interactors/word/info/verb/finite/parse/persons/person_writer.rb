module Word
  module Info
    module Verb
      module Finite
        module Parse
          module Persons
            class PersonWriter < Word::Info::Verb::Base
              delegate :parsed_person, :item, to: :context

              def call
                item.persons ||= []
                item.persons << parsed_person
              end
            end
          end
        end
      end
    end
  end
end
