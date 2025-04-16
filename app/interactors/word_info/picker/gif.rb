module WordInfo
  module Picker
    class Gif
      include Interactor

      delegate :items, :base_item, to: :context

      def call
        context.gif = base_item["gifs"].sample
      end
    end
  end
end
