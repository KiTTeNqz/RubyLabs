class DataList
	private_class_method :new

	attr_accessor :list, :selected_ids

	def initialize(elems)
		self.list = elems.sort_by(&:id)
		self.selected_ids = []
	end

	def select(number)
		element = self.list[number-1]
		self.selected_ids << element.id
	end

	def get_selected
		self.selected_ids
	end

	def get_names
		self.list.first.instance_variables.map{|v| v.to_s[1..-1]}
	end

	def get_data
		data = [[*(1..self.list.length)]]
		data += self.list.map{|elem| instance_variables_wout_id(elem)}
		DataTable.new(data)
	end

	def append(new_data)
		self.list.append(new_data)	
	end

	private
	def instance_variables_wout_id(object)
		object.instance_variables.reject{|v| v.to_sym ==:@id}.map{|v| object.instance_variable_get(v)}
	end



end