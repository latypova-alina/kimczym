module Word
  module Info
    module Picker
      class Pick
        include Interactor::Organizer

        organize InitialWord, DefaultForm, Items, BaseItem, Gif
      end
    end
  end
end
