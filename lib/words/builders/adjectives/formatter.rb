module Words
  module Builders
    module Adjectives
      class Formatter < Base
        def initialize(items, item)
          super()
          @items = items
          @item = item
        end

        def call
          join_contents.map do |sub_item|
            "<strong>#{sub_item.degree.translation} / #{sub_item.number.translation} / #{sub_item.gender.translation}</strong>\n\n" <<
              sub_item.cases.map do |grammatical_case|
                "<strong>#{grammatical_case.translation}</strong> #{grammatical_case.value}"
              end.join("\n")
          end.join("\n\n")
        end

        private

        def join_contents
          return [item] unless JOIN_CONTENTS[item.key_name].present?

          JOIN_CONTENTS[item.key_name].map { |key_name| find_item(items, key_name) }
        end

        attr_reader :items, :item
      end
    end
  end
end
