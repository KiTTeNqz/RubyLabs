# frozen_string_literal: true

class Printer
  def print(text)
    puts text
  end
end

class Display
  def display(text)
    puts text
  end
end

class DisplayAdapter
  def initialize(display)
    @display = display
  end

  def print(text)
    @display.display(text)
  end
end

printer = Printer.new
display = Display.new
adapter = DisplayAdapter.new(display)

printer.print("Hello, world!") # выводит "Hello, world!"
adapter.print("Hello, world!") # также выводит "Hello, world!"