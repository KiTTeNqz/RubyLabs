class DataList
	def initialize(elems)
		@list = elems.sort_by(&:id)
		@selected_ids = []
	end

	def select(number)
		element = @list[number-1]
		@selected_ids << element.id
	end

	def get_selected
		@selected_ids
	end

	def get_names
		raise NotImplementedError, "Реализован в наследнике"
	end

	def get_data
		raise NotImplementedError, "Реализован в наследнике"
	end

end