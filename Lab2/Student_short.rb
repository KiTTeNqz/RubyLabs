require 'json'
class StudentShort
	attr_accessor :id, :contact, :fio, :git

	def self.from_student_class(student)
		StudentShort.new(student.id, student.get_info)
	end

	def initialize(id, str)
		info_short = str
		raise ArgumentError, 'Missing fields: fio' if info_short[:short_fio].nil?
		self.id=id
		self.fio = info_short[:short_fio]
		self.contact = info_short[:short_contact].transform_keys(&:to_sym)
		self.git = info_short[:git]
	end


	#Хэщ, содержащий свойства объекта с безопасным доступом(.&)
	def to_h
		{
			id: id,
			git: git,
			contact&.dig(:type)&.to_sym => contact&.dig(:value),
		}
	end

	def to_s
		[
			"#{id}, #{fio}, #{git}, #{contact}"
		].compact.join(' ')
	end

end
