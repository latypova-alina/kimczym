module Words
  module Builders
    module Nouns
      class Base
        NAME = :subst.freeze

        def self.call(*args)
          new(*args).call
        end

        def initialize(items)
          @items = items
          @result = {}
        end

        def call
          build_result
          
          result
        end

        private

        def build_result
          raise NotImplementedError
        end

        attr_reader :items
        attr_accessor :result
      end
    end
  end
end
