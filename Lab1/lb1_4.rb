def idxMin(arr)
	return arr.index(arr.min)
end


def countInterval(arr, a, b)
	return arr.slice(a+1...b).length
end


def idxLastMin(arr)
	return arr.rindex(arr.min)
end

def betweenMins(arr)
	return countInterval(arr,idxMin(arr),idxLastMin(arr))
end

def countInNums(arr, a, b)
	return arr.select{|e| e.between?(a,b)}.length
end

def differ2Arrs(arr1, arr2)
	return arr1.find_all{|x| arr1.count(x)==1}.difference(arr2).union(arr2.find_all{|x| arr2.count(x)==1}.difference(arr1))
end

#a=[1,3,-4,-5,6,8,-3,-5,10,3]
#b=[2,8,-4,-7,6,12,-15,-3,1,1]

puts "Вечер добрый! Какую программу запустим?

2 - idxMin
14 - count in countInterval
26 - betweenMins
38 - countInNums
50 - differenceBetween2Arrs"

meth = gets.chomp.to_i

case meth
	when meth = 2
		puts "Введите массив для обработки"
		arr = gets.chomp.split(' ').map(&:to_i)
		puts "Введённый массив: #{arr.inspect}"
		puts idxMin(arr)
	when meth = 14
		puts "Введите массив для обработки"
		arr = gets.chomp.split(' ').map(&:to_i)
		puts "Введите a"
  		a = gets.chomp.to_i
  		puts "Введите b"
  		b = gets.chomp.to_i
  		puts countInterval(arr,a,b)
	when meth = 26
		puts "Введите массив для обработки"
		arr = gets.chomp.split(' ').map(&:to_i)
		puts betweenMins(arr)
	when meth = 38
		puts "Введите массив для обработки"
		arr = gets.chomp.split(' ').map(&:to_i)
		puts "Введите a"
  		a = gets.chomp.to_i
  		puts "Введите b"
  		b = gets.chomp.to_i
  		puts countInNums(arr,a,b)
	when meth = 50
		puts "Введите 1 массив для обработки"
		arr1 = gets.chomp.split(' ').map(&:to_i)
		puts "Введите 2 массив для обработки"
		arr2 = gets.chomp.split(' ').map(&:to_i)
		puts differ2Arrs(arr1, arr2)
	else
		puts "Error"
end


#puts "Array: #{a}\n"
#puts idxMin(a)
#puts countInterval(a, 5, -1)
#puts betweenMins(a)
#puts countInNums(a, -1, 10)
#puts differ2Arrs(a, b)