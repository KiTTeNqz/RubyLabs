class Student
	attr_accessor :id
	attr_reader :phone, :last_name, :first_name, :parental_name, :git, :telegram, :email

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


	def self.validate_phone(phone)
		return phone.match(/^\+?[7,8] ?\(?\d{3}\)? ?\d{3}-?\d{2}-?\d{2}$/)
	end

	def phone=(phone)
		raise ArgumentError, "ERROR PHONE=#{phone}" unless phone.nil? || Student.validate_phone(phone)
		@phone = phone
	end

	def self.validate_name(name)
		return name.match(/(^[А-Я][а-я]+$)|(^[A-Z][a-z]+$)/)
	end

	def first_name=(first_name1)
		raise ArgumentError, "ERROR first_name=#{first_name1}" unless Student.validate_name(first_name1)
		@first_name=first_name1
	end

	def last_name=(last_name1)
		raise ArgumentError, "ERROR last_name=#{last_name1}" unless Student.validate_name(last_name1)
		@last_name=last_name1
	end

	def parental_name=(parental_name1)
		raise ArgumentError, "ERROR parental_name=#{parental_name1}" unless Student.validate_name(parental_name1)
		@parental_name=parental_name1
	end

	def self.validate_git_tg(acc_name)
		return acc_name.match(/^@[A-Za-z0-9\-_]+$/)
	end

	def telegram=(tg_name)
		raise ArgumentError, "ERROR telegram=#{tg_name}" unless telegram.nil? || Student.validate_git_tg(tg_name)
		@telegram=tg_name
	end

	def git=(git_name)
		raise ArgumentError, "ERROR git=#{git_name}" unless git.nil? || Student.validate_git_tg(git_name)
		@git=git_name
	end

	def self.validate_email(email)
		return email.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+(\.[A-Za-z]+)?\.[A-Za-z]+$/)
	end

	def email=(email1)
		raise ArgumentError, "ERROR email=#{email1}" unless email.nil? || Student.validate_email(email1)
		@email=email1
	end

	def validate_contact()
		!email.nil? || !telegram.nil? || !phone.nil?
	end

	def validate()
		!git.nil? && validate_contact()
	end
	

end
