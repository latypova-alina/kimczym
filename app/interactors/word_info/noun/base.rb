module WordInfo
  module Noun
    class Base
      include WordInfoHelper
      include Words::Nouns::Constants
      include Interactor
    end
  end
end
