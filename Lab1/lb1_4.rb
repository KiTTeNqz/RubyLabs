def idxMin(arr)
	return arr.index(arr.min)
end


def countInterval(arr, a, b)
	return arr.slice(a..b).length
end


def idxLastMin(arr)
	return arr.rindex(arr.min)
end

def betweenMins(arr)
	return arr.slice(idxMin(arr)+1...idxLastMin(arr)).length
end

def countInNums(arr, a, b)
	return arr.select{|e| e.between?(a,b)}.length
end

a=[1,3,-4,-5,6,8,-3,-5,10]
#puts "Array: #{a}\n"
#puts idxMin(a)
#puts countInterval(a, 5, -1)
#puts betweenMins(a)
puts countInNums(a, -1, 10)