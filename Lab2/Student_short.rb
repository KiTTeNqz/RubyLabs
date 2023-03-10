require 'json'
require_relative 'StudentBase'
class StudentShort < StudentBase

	public_class_method :new

	#У нас уже есть некоторые гет\сет в базе, зачем же ещё?
	private
	attr_writer :fio, :contact

	public
	attr_reader :fio, :contact


	def self.from_student_class(student)
		StudentShort.new(student.id, student.get_info)
	end

	def initialize(id, str)
		info_short = str
		raise ArgumentError, 'Missing fields: fio' if info_short[:short_fio].nil?
		self.id=id
		self.fio = info_short[:short_fio]
		self.contact = info_short[:short_contact]
		self.git = info_short[:git]
	end


	#Хэsh, содержащий свойства объекта с безопасным доступом(.&)
	def to_h
		{
			id: id,
			git: git,
			contact&.dig(:type)&.to_sym => contact&.dig(:val),
		}
	end

	def to_s
		[
			"#{id}, #{fio}, #{git}, #{contact[:type]}, #{contact[:val]}"
		].compact.join(' ')
	end

end
