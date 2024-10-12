module Word
  module Info
    module Verb
      module Finite
        module Format
          class Heading < Word::Info::Verb::Base
            delegate :item, to: :context

            def call
              context.heading = heading
            end

            private

            def heading
              "<strong>#{FINITE_NAME} / #{item.number.translation}</strong>\n\n"
            end
          end
        end
      end
    end
  end
end
