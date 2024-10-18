module WordInfo
  module Picker
    class Pick
      include Interactor::Organizer

      organize InitialWord, Items, BaseItem, DefaultForm, Filter, Gif
    end
  end
end
