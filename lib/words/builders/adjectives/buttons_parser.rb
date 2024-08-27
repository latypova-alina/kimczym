module Words
  module Builders
    module Adjectives
      class ButtonsParser < Base

        private

        def build_result          
          BUTTONS.keys.each do |button_key|
            result[button_key] ||= {}
            result[button_key]["buttons"] = BUTTONS[button_key]
          end
        end

        # def translated_buttons(button_key)
        #   translated_buttons = BUTTONS[button_key]

        #   translated_buttons.each do |category, values|
            
        #   end
        # end
      end
    end
  end
end
