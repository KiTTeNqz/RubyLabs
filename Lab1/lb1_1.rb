puts 'Hello World'
puts "Hello, #{ARGV[0]}."
puts "Какой твой любимый язык?"

r = STDIN.gets.chomp
case r
	when 'ruby'
		puts 'Подлиза'
	else
		puts 'Почему не руби?!'
end

puts 'Enter ruby command: '
comRuby = STDIN.gets.chomp
system "ruby -e \'#{comRuby}\'"

puts 'Enter OS command: '
comSys = STDIN.gets.chomp
puts `#{comSys}`