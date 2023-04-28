# frozen_string_literal: true

# frozen_string_literal: true
require_relative 'student_list_adv'
require_relative 'student_list_adapter'
require_relative './database/student_list_db'
require_relative 'Converter_json'
require_relative 'Converter'
require_relative 'Student_list'
require 'mysql2'
class StudentListController
  def initialize(view)
    begin
      @student_list = StudentListAdv.new(StudentsListDBAdapter.new(StudentListDB.instance))
    rescue Mysql2::Error::ConnectionError
      api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
      api.call(0, "No connection to DB", "Error", 0)
      exit(false)
      return
    end
    #@student_list = StudentListAdv.new(StudentsListConverterAdapter.new(StudentList.new(ConverterJSON.new),
    #                                                                    'C:/Users/Дмитрий/RubymineProjects/RubyLabs/Lab2/studentsRead.json'))
    @view = view
    @data_list = DataListStudentShort.new
  end


  def add_student(student)
    @student_list.add_student(student)
  end

  def get_student(id)
    @student_list.get_student(id)
  end

  def remove_student(id)
    @student_list.remove_student(id)
  end

  def replace_student(id, student)
    @student_list.replace_student(id, student)
  end

  def get_students_pag(k, n)
    students_list_adapter.get_students_pag(k, n)
  end

  def count
    @student_list.count
  end

  def refresh_data(page, per_page)
    @data_list = @student_list.get_students_pag(page, per_page, @data_list)
    @data_list.objects.map{|el| print("DT: "+el.to_s)}
    @view.update_student_count(@student_list.count)
  end

end
