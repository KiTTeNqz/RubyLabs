require_relative 'Student'
class StudentListTxt

	public
	attr_accessor :students, :gen_id

	def initialize
		self.students = []
		self.gen_id = students.count + 1
	end

	def read_from_txt(file_path)
		raise ArgumentError.new("File not found #{file_path}") unless File.file?(file_path)
		File.foreach(file_path) do |line|
			students << Student.from_str(line.strip)
		end
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

	def student_by_id(stud_id)
		students.find{|s| s.id == stud_id}
	end

	def sorted
		students.sort_by(&:fio)
	end

	def add_student(student)
		students << student
		student.id = gen_id
		nextId
	end

	def idk(k,n,existing_data: nil)
		skip = (k-1) * n
		new_data = students[skip, n].map{|s| StudentShort.from_student_class(s)}

		return DataListStudentShort.new(new_data) if existing_data.nil?

		existing_data.append(new_data)
	end

	def replace_student(student_id, student)
		idx = student.find{|s| s.id==student.id}
		students[idx]=student
	end

	def delete_student(student_id)
		students.reject! {|s| s.id==student.id}
	end

	def nextId
		self.gen_id=students.max_by(&:id) + 1
	end
end