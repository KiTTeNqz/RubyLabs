require 'json'
class StudentBase
	private_class_method :new

	attr_accessor :id, :phone, :telegram, :git, :email

	def self.validate_phone?(phone)
		return phone.match(/^\+?[7,8] ?\(?\d{3}\)? ?\d{3}-?\d{2}-?\d{2}$/)
	end

	def self.validate_email?(email)
		return email.match(/^[A-Za-z0-9\-_]+@[A-Za-z]+(\.[A-Za-z]+)?\.[A-Za-z]+$/)
	end

	def self.validate_git_tg?(acc_name)
		return acc_name.match(/^@[A-Za-z0-9\-_]+$/)
	end

	def self.validate_name?(prof_name)
		return prof_name.match(/(^[А-Я][а-я]+$)|(^[A-Z][a-z]+$)/)
	end

	private_class_method
	def valid_cont?
		!email.nil? || !telegram.nil? || !phone.nil?
	end

	def validate?
		!git.nil? && valid_cont?
	end

	def get_short_contact
		contact = %i[telegram phone email].find{|cont| send(cont)}
		{type: contact, val: send(contact) } if contact
	end

	def initialize(options = {})
		self.id = options[:id]
		self.phone = options[:phone]
		self.git = options[:git]
		self.telegram = options[:telegram]
		self.email = options[:email]
	end

	#Setters
	def phone=(phone)
		raise ArgumentError, "ERROR PHONE=#{phone}" unless phone.nil? || StudentBase.validate_phone?(phone)
		@phone = phone
	end

	def telegram=(tg_name)
		raise ArgumentError, "ERROR telegram=#{tg_name}" unless telegram.nil? || StudentBase.validate_git_tg?(tg_name)
		@telegram=tg_name
	end

	def git=(git_name)
		raise ArgumentError, "ERROR git=#{git_name}" unless git.nil? || StudentBase.validate_git_tg?(git_name)
		@git=git_name
	end

	def email=(email1)
		raise ArgumentError, "ERROR email=#{email1}" unless email.nil? || StudentBase.validate_email?(email1)
		@email=email1
	end

end