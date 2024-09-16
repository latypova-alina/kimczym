module Word
	module Info
		class Base
			include Interactor

			delegate :base_item, :items, :processed_items, :form_name, to: :context

			def call
        set_params
				context.fail! if corresponding_class.nil?
      end

      private

      def corresponding_class
        raise NotImplementedError
      end

      def set_params
        context.form_name ||= base_item["form"].split(":")[0]
        context.processed_items ||= []
      end
		end
	end
end
