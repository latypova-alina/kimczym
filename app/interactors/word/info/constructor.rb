module Word
	module Info
		class Constructor
			include Interactor::Organizer

			# TODO if fails, raise ::WordNotFoundError
		  organize Picker::Picker, Builder, Formatter
		end
	end
end
