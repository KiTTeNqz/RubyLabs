class DataTable

	def initialize(data)
		@data = data
	end

	def get_cell(row,col)
		@data[row][col]
	end

	def num_columns
		@data[0].length
	end

	def num_rows
		@data.length
	end

end