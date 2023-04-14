require_relative 'Student'
require_relative 'Student_short'
require_relative 'Data_list'
require_relative 'Data_list_student_short'
require_relative 'Student_list'
require_relative 'Converter_yaml'
require_relative 'Converter_txt'
require_relative 'Converter_json'
require_relative './database/student_list_db'
require 'mysql2'

db = StudentListDB.new
puts db.get_student(2)
puts db.count