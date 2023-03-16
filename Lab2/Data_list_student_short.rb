require_relative 'Student_short'
require_relative 'Data_table'
class DataListStudentShort < DataList

	def initialize(data)
		super(data)
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
		object.instance_variables.map{|v| object.instance_variable_get(v) unless v.to_sym == :@id}
	end

end