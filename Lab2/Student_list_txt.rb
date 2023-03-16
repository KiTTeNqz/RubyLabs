class StudentListTxt
	def self.read_from_txt(file_path)
		raise ArgumentError.new("File not found #{file_path}") unless File.file?(file_path)

		students = []
		stud=""
		File.foreach(file_path) do |line|
			students<<Student.from_str(line)
		end
		students
	end

	def self.write_to_txt(students,file_path)
		File.open(file_path, 'w'){ |file|
			file.write(
				students.map{
					|stud| stud.get_info
				}.join()
				)
		}
	end
end