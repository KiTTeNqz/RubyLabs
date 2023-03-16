class DataList
	private_class_method :new

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
		@list.first.instance_variables.map{|v| v.to_s[1..-1]}
	end

	def get_data
		data = [[*(1..@list.length)]]
		data += @list.map{|elem| instance_variables_wout_id(elem)}
		DataTable.new(data)
	end

	private
	def instance_variables_wout_id(object)
		object.instance_variables.reject{|v| v.to_sym ==:@id}.map{|v| object.instance_variable_get(v)}
	end



end