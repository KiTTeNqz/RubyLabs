# frozen_string_literal: true

class StudentsListAdapter
  def get_student(id)
  end

  def remove_student(id)
  end

  def replace_student(id, student)
  end

  def get_students_slice(k, n)
  end

  def add_student(student)
  end

  def count
  end
end

class StudentsListDBAdapter < StudentsListAdapter
  private
  attr_accessor :database_list

  public
  def initialize(database_list)
    self.database_list = database_list
  end

  def get_student(id)
    database_list.get_student(id)
  end

  def remove_student(id)
    database_list.remove_student(id)
  end

  def replace_student(id, student)
    database_list.replace_student(id, student)
  end

  def get_students(from, to)
    database_list.get_students(from, to)
  end

  def add_student(student)
    database_list.add_student(student)
  end

  def count
    database_list.count
  end
end

class StudentsListConverterAdapter < StudentsListAdapter
  private
  attr_accessor :converter

  public
  def initialize(converter, filename)
    self.converter = converter
    converter.read_file(filename)
  end

  def get_student(id)
    converter.get_student(id)
  end

  def remove_student(id)
    converter.remove_student(id)
  end

  def replace_student(id, student)
    converter.replace_student(id, student)
  end

  def get_students_pag(k, n)
    converter.get_students_pag(k, n)
  end

  def add_student(student)
    converter.add_student(student)
  end

  def count
    converter.count
  end
end