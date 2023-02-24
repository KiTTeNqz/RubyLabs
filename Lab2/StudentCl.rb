class Student
	attr_accessor :id, :phone, :telegram, :git, :email, :last_name, :first_name, :parental_name

	def initialize(last_name, first_name, parental_name, id=nil, phone=nil, telegram=nil, email=nil, git=nil)
		self.last_name = last_name
		self.first_name = first_name
		self.parental_name = parental_name
		self.id = id
		self.phone = phone
		self.git = git
		self.telegram = telegram
		self.email = email
	end

end