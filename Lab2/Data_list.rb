class Data_list
	def initialize(elems)
		@list = elems.sort_by(&:id)
		@selected_ids = []
	end

	def select(number)
		element = @list[number-1]
		@selected_ids << element.id
	end

	def get_selected
		raise NotImplementedError, "Должен быть реализован в наследниках"
	end

	def get_data
		raise NotImplementedError, "Должен быть реализован в наследниках"
	end

end