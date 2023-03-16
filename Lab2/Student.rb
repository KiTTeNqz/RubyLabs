require 'json'
require_relative 'StudentBase'
class Student < StudentBase

	public_class_method :new
	attr_writer :id
	public
	attr_reader :last_name, :first_name, :parental_name, :id, :phone, :git, :telegram, :email

	def initialize(last_name, first_name, parental_name, options = {})
		super(last_name, first_name, parental_name)
		self.id = options[:id]
		self.phone = options[:phone]
		self.git = options[:git]
		self.telegram = options[:telegram]
		self.email = options[:email]
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


	#Setters
	def phone=(phone)
		raise ArgumentError, "ERROR phone=#{phone}" unless phone.nil? || StudentBase.validate_phone?(phone)
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
		"fio:#{last_name} #{first_name[0]}. #{parental_name[0]}."
	end


	def get_short_contact
		contact = %i[telegram phone email].find{|cont| send(cont)}
		{type: contact, val: send(contact)} if contact
	end

	def get_git
		"git:#{git}"
	end

	def get_info
		puts("Get_info #{get_short_fio},#{get_short_contact[:type]}:#{get_short_contact[:val]},#{get_git}")
		"#{get_short_fio},#{get_short_contact[:type]}:#{get_short_contact[:val]},#{get_git}"
	end

	def get_info_hash
		info={}
		info[:fio] = get_short_fio
		info[:contact] = get_short_contact
		info[:git] = git
		info
	end

end
