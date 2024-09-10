module Words
  module Builders
    module Adjectives
      class Base
        include ApplicationHelper
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
