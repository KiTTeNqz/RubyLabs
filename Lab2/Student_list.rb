class StudentList
	attr_accessor :students, :gen_id, :typer

	def initialize(typer)
		self.students = []
		self.gen_id = students.count + 1
		self.typer = typer
	end

	def read_file(file_path)
		raise ArgumentError.new("File not found #{file_path}") unless File.file?(file_path)
		hash_students = typer.convert_read(File.read(file_path))
		self.students = hash_students.map{|h| Student.from_hash(h)}
		nextId
	end

	def write_file(file_path)
		hash_students = students.map(&:to_hash)
		File.write(file_path, typer.convert_write(hash_students))
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
		self.students[idx]=student
	end

	def delete_student(student_id)
		self.students.reject! {|s| s.id==student.id}
	end

  def get_students_count
		self.students.count
	end

	def nextId
		self.gen_id=students.max_by(&:id).id + 1
	end

end