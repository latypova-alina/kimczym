module Word
  module Info
    module Adjective
      class Base
        include WordInfoHelper
        include Words::Adjectives::Constants
        include Interactor
      end
    end
  end
end
