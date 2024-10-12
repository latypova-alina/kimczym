module Word
  module Info
    module Verb
      module Finite
        module Format
          class Body < Word::Info::Verb::Base
            delegate :item, to: :context

            def call
              context.body = body
            end

            private

            def body
              item.persons.map do |person|
                "<strong>#{person.translation}</strong> #{person.value}"
              end.join("\n")
            end
          end
        end
      end
    end
  end
end
