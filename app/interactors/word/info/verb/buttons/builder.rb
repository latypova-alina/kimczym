module Word
  module Info
    module Verb
      module Buttons
        class Builder < Word::Info::Verb::Base
          delegate :key_name, to: :context

          def call
            context.buttons = parsed_buttons
          end

          private

          def parsed_buttons
            CategoryButtonsParser.call(key_name:, category: "verb_form").parsed_buttons
          end
        end
      end
    end
  end
end
