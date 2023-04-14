require_relative 'Student_short'
require_relative 'Data_table'
require_relative 'Data_list'
class DataListStudentShort < DataList

	public_class_method :new
	def initialize(*data)
		super(data)
	end

end