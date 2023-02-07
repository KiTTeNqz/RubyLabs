def minArr(arr)
	minim=arr[0]
	for i in 0..arr.length
		if arr[i].to_i<minim 
			then minim=arr[i].to_i 
		end
	end
	return minim
end

def firstPos(arr)
	for i in 0..arr.length
		return i if arr[i].to_i>0
	end
	return -1
end

if ARGV.count<2
	puts 'Введите 2 аргумента(метод, путь)!!!'
	return
end

meth = ARGV[0]
path = ARGV[1]

file = File.open(path)
array = file.readline.split(' ').map(&:to_i)
file.close()

puts "Array: #{array}\n"

case meth
	when 'minArr'
		puts "Min in arr: #{minArr(array)}"
	when 'fP'
		puts "First positive in arr: #{firstPos(array)}"
	else
		puts "Unknown method" 
end




#a=[1,3,-4,6,8,-3,-5, 10]
#puts minArr(a)
#puts firstPos(a)