module WordInfo
  module Verb
    class Base
      include WordInfoHelper
      include Words::Verbs::Constants
      include Interactor
    end
  end
end
