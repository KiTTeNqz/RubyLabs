class Student
	attr_accessor :id, :phone, :telegram, :git, :email, :last_name, :first_name, :parental_name

	def initialize(last_name, first_name, parental_name, options = {})
		self.last_name = last_name
		self.first_name = first_name
		self.parental_name = parental_name
		self.id = options[:id]
		self.phone = options[:phone]
		self.git = options[:git]
		self.telegram = options[:telegram]
		self.email = options[:email]
	end

	def to_s
		result = "#{last_name} #{first_name} #{parental_name}"
		result += " id=#{id}" unless id.nil?
		result += " phone=#{phone}" unless phone.nil?
		result += " git=#{git}" unless git.nil?
		result += " telegram=#{telegram}" unless telegram.nil?
		result += " email=#{email}" unless email.nil?
	end

	def self.validate_phone
		return phone.match(/^\+?[7,8] ?\(?\d{3}\)? ?\d{3}-?\d{2}-?\d{2}$/)
	end

end

stud1 = Student.new(1, 2, 3, {id: 4, phone: 5, git: 6, telegram: 7, email:8})
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