# frozen_string_literal: true

require 'win32api'

class StudentInputFormController
  def initialize(view, existing_student)
    @view = view
    @existing_student = existing_student
  end

  def on_view_created
    begin
      @student_list = StudentListAdv.new(StudentsListDBAdapter.new(StudentListDB.instance))
    rescue Mysql2::Error::ConnectionError
      on_db_conn_error
    end
  end

  def save_student(student)
    if @existing_student.nil?
      @student_list.add_student(student)
    else
      @student_list.replace_student(@existing_student[:id], student)
    end
  end

  def on_db_conn_error
    api = Win32API.new('user32', 'MessageBox', ['L', 'P', 'P', 'L'], 'I')
    api.call(0, "No connection to DB", "Error", 0)
    @view.close
  end
end
