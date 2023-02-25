require_relative 'StudentCl'

stud1 = Student.new(1, 2, 3, {id: 4, phone: "+79054037715", git: 6, telegram: 7, email:8})
stud2 = Student.new(1, 2, 3, {id: 4})
stud3 = Student.new(1, 2, 3)
stud4 = Student.new(1, 2, 3, {phone: 4, email: 5})
stud5 = Student.new(1, 2, 3, {telegram: 4, phone: 5, id: 6})
stud6 = Student.new(1, 2, 3, {id: 4, email: 5, phone: 6, telegram: 7})

puts(stud1.to_s())
puts(stud2.to_s())
puts(stud3.to_s())
puts(stud4.to_s())
puts(stud5.to_s())
puts(stud6.to_s())