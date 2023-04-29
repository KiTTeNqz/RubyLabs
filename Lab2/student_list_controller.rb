# frozen_string_literal: true

# frozen_string_literal: true
require_relative 'student_list_adv'
require_relative 'student_list_adapter'
require_relative './database/student_list_db'
require_relative 'Converter_json'
require_relative 'Converter'
require_relative 'Student_list'
require 'win32api'
require 'mysql2'
class StudentListController
  def initialize(view)
    @view = view
    @data_list = DataListStudentShort.new()
    @data_list.add_listener(@view)
  end

  def on_view_created
    begin
      @student_list = StudentListAdv.new(StudentsListDBAdapter.new(StudentListDB.instance))
    rescue Mysql2::Error::ConnectionError
      on_db_conn_error
    end
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

  def delete_selected(current_page, per_page, selected_row)
    begin
      student_num = (current_page - 1) * per_page + selected_row
      @data_list.select_element(student_num)
      student_id = @data_list.selected_id
      @student_list.remove_student(student_id)
    rescue
      on_db_conn_error
    end
  end


  def refresh_data(page, per_page)
    begin
      @data_list = @student_list.get_students_pag(page, per_page, @data_list)
      @view.update_student_count(@student_list.count)
    rescue
      on_db_conn_error
    end
  end

  def on_db_conn_error
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "No connection to DB", "Error", 0)
    exit(false)
  end

end
