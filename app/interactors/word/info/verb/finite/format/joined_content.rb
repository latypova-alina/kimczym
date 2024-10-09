module Word
  module Info
    module Verb
      module Finite
        module Format
          class JoinedContent < Word::Info::Verb::Base
            delegate :item, :processed_items, to: :context

            def call
              context.formatted_text = formatted_text
            end

            private

            def formatted_text
              join_contents.map { |sub_item| Text.call(item: sub_item).text }.join("\n\n")
            end

            def join_contents
              return [item] unless FIN_JOIN_CONTENTS[item.key_name].present?

              FIN_JOIN_CONTENTS[item.key_name].map { |key_name| find_item(processed_items, key_name) }
            end
          end
        end
      end
    end
  end
end
