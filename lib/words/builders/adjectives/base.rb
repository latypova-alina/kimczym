module Words
  module Builders
    module Adjectives
      class Base
        include Words::Builders::Adjectives::Constants
        
        NAME = :adj

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

        def default_formatted_text
          result[DEFAULT_BUTTON_KEY]["formatted_text"]
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
