require 'json'
class StudentListJSON
	def self.read(file_path)
		file_content = File.read(file_path)

		people_data = JSON.parse(file_content)

		puts(people_data)
	end
end

StudentListJSON.read('/home/dmitry/RubyLabs/Lab2/studentsRead.json')