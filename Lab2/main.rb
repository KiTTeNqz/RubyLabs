require_relative 'Student'
require_relative 'Student_short'
require_relative 'Data_list'
require_relative 'Data_list_student_short'
require_relative 'Student_list'
require_relative 'Converter_yaml'
require_relative 'Converter_txt'
require_relative 'Converter_json'

stud1 = Student.new("Иванов", "Иван", "Иванович", {id: 1, phone: "+79051111111", git: "@6", telegram: "@7", email:"s0163526@edu.kubsu.ru"})
stud2 = Student.new("Сидоров", "Сергей", "Петрович", {id: 2})
stud3 = Student.new("Худокормов", "Дмитрий", "Александрович")
stud4 = Student.new("Ильченко", "Никита", "Алексеевич", {phone: "8 905 222-22-22", email: "123@mail.ru"})
stud5 = Student.new("Романов", "Роман", "Романович", {telegram: "@4", phone: "+7(905)333-33-33", id: 6})
stud6 = Student.new("Петров", "Олег", "Михайлович", {id: 3, email: "myMail@yandex.ru", phone: "+7 (905) 444-44-44", telegram: "@8"})



students = [stud1, stud5, stud6].map{|student| StudentShort.from_student_class(student)}
datalist  = DataListStudentShort.new(students)
datalist.select(1)

puts datalist.get_selected
puts datalist.get_names
puts datalist.get_data.inspect

yaml = StudentList.new(ConverterYAML.new)
json = StudentList.new(ConverterJSON.new)
txt = StudentList.new(ConverterTxt.new)

yaml.read_file('/home/dmitry/RubyLabs/Lab2/studentsRead.yaml')
puts("YAML DINE")
json.read_file('/home/dmitry/RubyLabs/Lab2/studentsRead.json')
puts("JSON DINE")
txt.read_file('/home/dmitry/RubyLabs/Lab2/studentsRead.txt')
puts("TXT DINE")

puts(yaml.students)
puts(json.students)
puts(txt.students)

yaml.add_student(Student.from_str('fio: Голубев Глеб Газманович'))
json.add_student(Student.from_str('fio: Дорогов Дмитрий Далдалович'))
txt.add_student(Student.from_str('fio: Голубев Глеб Газманович'))

yaml.write_file('/home/dmitry/RubyLabs/Lab2/studentsWrite.yaml')
json.write_file('/home/dmitry/RubyLabs/Lab2/studentsWrite.json')
txt.write_file('/home/dmitry/RubyLabs/Lab2/studentsWrite.txt')