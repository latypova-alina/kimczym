module Word
  module Info
    class Constructor
      include Interactor::Organizer

      organize Picker::Pick, Builder, Formatter
    end
  end
end
