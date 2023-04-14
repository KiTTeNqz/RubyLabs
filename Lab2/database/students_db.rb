# frozen_string_literal: true
require 'mysql2'
class Students_db

  attr_accessor :db_connection

  def initialize()
    self.db_connection = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "Tgi765bitrus")
    self.db_connection.query('CREATE DATABASE IF NOT EXISTS stud_db')
    self.db_connection.query('USE stud_db')
    self.db_connection.query('DROP TABLE IF EXISTS student')
    self.db_connection.query(File.read('C:/Users/Дмитрий/RubymineProjects/RubyLabs/Lab2/database/scripts/create_table.sql'))
    self.insert_data
  end

  def insert_data
    db_connection.query(File.read('C:/Users/Дмитрий/RubymineProjects/RubyLabs/Lab2/database/scripts/insert_data.sql'))
  end

  def select_by_id(id)
    db_connection.query("SELECT * FROM student WHERE id = #{id}").map{|x| x}[0]
  end

end

students_db = Students_db.new
students_db.insert_data