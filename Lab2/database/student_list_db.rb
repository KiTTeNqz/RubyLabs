# frozen_string_literal: true
require_relative './students_db.rb'

class StudentListDB
  attr_accessor :database

  @@instance = nil

  def self.instance
    @@instance ||= StudentListDB.new
  end
  
  private_class_method :new


  def initialize
    self.database = StudentDB.new()
  end

  def get_student(id)
    Student.from_hash(database.select_by_id(id).transform_keys(&:to_sym))
  end

  def remove_student(id)
    database.remove_by_id(id)
  end

  def replace_student(id, student)
    database.replace_by_id(id, student)
  end

  def add_student(student)
    database.add_student(student.as_json)
  end

  def get_students_pag(k, n)
    database.get_k_n_student_short_list(k, n)
  end

  def count
    database.count
  end
end
