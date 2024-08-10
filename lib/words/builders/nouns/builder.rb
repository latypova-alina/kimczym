module Words
  module Builders
    module Nouns
      class Builder
        def self.call(*args)
          new(*args).call
        end

        def initialize(items)
          @items = items
        end

        def call
          parsed_items = Parser.call(items)
          translated_items = Translator.call(parsed_items)
          Formatter.call(translated_items)
        end

        private

        attr_reader :items
      end
    end
  end
end
