# frozen_string_literal: true

class Database
  @@instance = nil

  def self.instance
    @@instance ||= Database.new
  end

  def execute
    print("Establishing connection...")
  end

  private_class_method :new
end