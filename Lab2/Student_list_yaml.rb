require 'yaml'
require_relative 'Student'
class StudentListYAML
	public
	attr_accessor :students, :gen_id

	def readFile(file_path)
		file_content = File.read(file_path)
		hashed_students = YAML.safe_load(file_content).map{ |h| h.transform_keys(&:to_sym)}
		hashed_students.each do |stud|
			students << Student.from_hash(stud)
		end
		nextId
	end

	def writeFile(hash, file_path)
		puts(hash)
		File.open(file_path, 'w') do |file|
			file.write(YAML.dump(hash.map{ |h| h.transform_keys(&:to_s)}))
		end
	end

	def initialize
		self.students = []
		self.gen_id = students.count + 1
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
		self.gen_id=students.max_by(&:id).id + 1
	end
end

studlist = StudentListYAML.new()
studlist.readFile('/home/dmitry/RubyLabs/Lab2/studentsRead.yaml')
studlist.add_student(Student.from_str('fio:Ежанов Еж Ежевич'))
studlist.writeFile(studlist.students.map(&:to_hash), '/home/dmitry/RubyLabs/Lab2/studentsWrite.yaml')
puts("DON!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
studlist.readFile('/home/dmitry/RubyLabs/Lab2/studentsWrite.yaml')
puts(studlist.students)
