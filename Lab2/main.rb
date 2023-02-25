require_relative 'StudentCl'

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