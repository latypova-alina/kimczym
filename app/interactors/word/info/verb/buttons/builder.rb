module Word
  module Info
    module Verb
      module Buttons
        class Builder < Word::Info::Verb::Base
          delegate :verb_form, to: :context

          def call
            context.buttons = buttons
          end

          private

          def buttons
            OpenStruct.new(
              verb_form: parsed_buttons(verb_form),
              key_name: verb_form,
              categories: BUTTONS_CATEGORIES
            )
          end

          def parsed_buttons(key_name)
            CategoryButtonsParser.call(key_name:, category: "verb_form").parsed_buttons
          end
        end
      end
    end
  end
end
