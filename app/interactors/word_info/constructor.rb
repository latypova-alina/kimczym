module WordInfo
  class Constructor
    include Interactor::Organizer

    organize Picker::Pick, Builder, Formatter
  end
end
