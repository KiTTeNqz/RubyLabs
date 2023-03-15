require_relative 'Student'
require_relative 'Student_short'

def self.read_from_txt(file_path)
	raise ArgumentError.new("File not found #{file_path}") unless File.file?(file_path)

	students = []
	stud=""
	File.foreach(file_path) do |line|
		stud << line
	end
	
	all_studs = JSON.parse(stud)
	all_studs["Students"].each do |hash_stud|
		students << Student.new(hash_stud['last_name'], 
								hash_stud['first_name'], 
								hash_stud['parental_name'], 
								hash_stud.delete_if{|k,v| k=='last_name'||k=='first_name'||k=='parental_name'}.transform_keys(&:to_sym))
	end
	students
end


def self.write_to_txt(students,file_path)
	out_string = '{"Students":['
	students.each do |stud|
		out_string+=stud.to_json+','
	end
	out_string = out_string.chop+"]}"
	File.write(file_path, out_string)
end


stud1 = Student.new("Иванов", "Иван", "Иванович", {id: 4, phone: "+79051111111", git: "@6", telegram: "@7", email:"s0163526@edu.kubsu.ru"})
stud2 = Student.new("Сидоров", "Сергей", "Петрович", {id: 4})
stud3 = Student.new("Худокормов", "Дмитрий", "Александрович")
stud4 = Student.new("Ильченко", "Никита", "Алексеевич", {phone: "8 905 222-22-22", email: "123@mail.ru"})
stud5 = Student.new("Романов", "Роман", "Романович", {telegram: "@4", phone: "+7(905)333-33-33", id: 6})
stud6 = Student.new("Петров", "Олег", "Михайлович", {id: 4, email: "myMail@yandex.ru", phone: "+7 (905) 444-44-44", telegram: "@8"})

puts(stud1.to_s())
puts(stud2.to_s())
puts(stud3.to_s())
puts(stud4.to_s())
puts(stud5.to_s())
puts(stud6.to_s())
puts()
puts(stud1.validate?)
puts(stud6.validate?)

stud3.set_contacts({email: "mrxameleonx@mail.ru"})
puts(stud3.to_s())
#stud_str = Student.from_str("Худокормов,Дмитрий,Александрович,123,99999")
#puts(stud_str.to_s())

puts(stud1.get_info())

stud_short = StudentShort.from_student_class(stud1)
puts(stud_short.to_s)

studs = read_from_txt('/home/dmitry/RubyLabs/Lab2/students.txt')

puts(studs)

short_studs = []
studs.each do |stud|
	short_studs << StudentShort.from_student_class(stud)
end

puts(short_studs)

write_to_txt(studs, '/home/dmitry/RubyLabs/Lab2/students1.txt')