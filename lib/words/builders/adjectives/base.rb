module Words
  module Builders
    module Adjectives
      class Base
        include Words::Builders::Adjectives::Constants

        def self.call(*args)
          new(*args).call
        end

        def call
          raise NotImplementedError
        end
      end
    end
  end
end
