require 'json'
require_relative 'StudentBase'
class Student < StudentBase

	public_class_method :new

	attr_reader :id, :phone, :last_name, :first_name, :parental_name, :git, :telegram, :email

	def initialize(last_name, first_name, parental_name, options = {})
		self.last_name = last_name
		self.first_name = first_name
		self.parental_name = parental_name
		super(options)
	end
	
	def to_s
		[
			"#{last_name} #{first_name} #{parental_name}",
			"id: #{id}",
			"git: #{git}",
			"telegram: #{telegram}",
			"email: #{email}"
		].compact.join(' ')
	end

	def first_name=(first_name1)
		raise ArgumentError, "ERROR first_name=#{first_name1}" unless StudentBase.validate_name(first_name1)
		@first_name=first_name1
	end

	def last_name=(last_name1)
		raise ArgumentError, "ERROR last_name=#{last_name1}" unless StudentBase.validate_name(last_name1)
		@last_name=last_name1
	end

	def parental_name=(parental_name1)
		raise ArgumentError, "ERROR parental_name=#{parental_name1}" unless StudentBase.validate_name(parental_name1)
		@parental_name=parental_name1
	end

	def set_contacts(contacts={})
		self.phone=contacts[:phone]
		self.telegram=contacts[:telegram]
		self.email=contacts[:email]
	end

	def self.from_str(string)
		last_name, first_name, parental_name, id, phone, git, telegram, email = string.split(',')
		options = {id: id, phone: phone, git: git, telegram: telegram, email: email}
		new(last_name, first_name, parental_name, options)
	end

	def get_short_fio
		"#{last_name} #{first_name[0]}.#{parental_name[0]}."
	end

	def get_info
		info = {}
		info[:short_fio] = get_short_fio
		info[:short_contact] = get_short_contact
		info[:git] = git
		info
	end

end
