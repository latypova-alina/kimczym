module Word
  module Info
    module Noun
      class Base
        include Words::Nouns::Iterator
        include WordInfoHelper
        include Words::Nouns::Constants
        include Interactor
      end
    end
  end
end
