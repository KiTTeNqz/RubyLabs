class Data_list
	def initialize(elems)
		@list = elems.sort_by(&:id)
		@selected_ids = []
	end

end