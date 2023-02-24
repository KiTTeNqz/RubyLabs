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

	def to_s()
		result = "#{last_name} #{first_name} #{parental_name}"
		result += " id=#{id}" unless id.nil?
		result += " phone=#{phone}" unless phone.nil?
		result += " git=#{git}" unless git.nil?
		result += " telegram=#{telegram}" unless telegram.nil?
		result += " email=#{email}" unless email.nil?
		result
	end

	def self.validate_phone
		return phone.match(/^\+?[7,8] ?\(?\d{3}\)? ?\d{3}-?\d{2}-?\d{2}$/)
	end

end

stud2 = Student.new(1, 2, 3, {id: 4})

puts(stud2.to_s())
