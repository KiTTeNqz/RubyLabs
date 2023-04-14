require_relative 'Student'
require_relative 'Student_short'
require_relative 'Data_list'
require_relative 'Data_list_student_short'
require_relative 'Student_list'
require_relative 'Converter_yaml'
require_relative 'Converter_txt'
require_relative 'Converter_json'
require 'mysql2'

dimasik=Mysql2::Client.new(:host => "localhost", :username => "root", :password => "Tgi765bitrus")
dimasik.query("USE stud_db")
results = dimasik.query("SELECT * FROM student")
puts results.map {|x| x.to_s}