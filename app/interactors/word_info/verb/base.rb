module WordInfo
  module Verb
    class Base
      include Words::Verbs::Iterator
      include WordInfoHelper
      include Words::Verbs::Constants
      include Interactor
    end
  end
end
