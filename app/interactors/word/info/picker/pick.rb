module Word
  module Info
    module Picker
      class Pick
        include Interactor::Organizer

        organize InitialWord, Items, BaseItem
      end
    end
  end
end
