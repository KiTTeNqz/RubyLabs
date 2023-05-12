require 'mysql2'
require 'mvcStudentXD'
require_relative 'main_window'

MainWindow.new.create.show
LoggerHolder.instance.level = Logger::DEBUG
