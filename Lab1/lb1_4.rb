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

def differ2Arrs(arr1, arr2)
	return arr1.find_all{|x| arr1.count(x)==1}.difference(arr2).union(arr2.find_all{|x| arr2.count(x)==1}.difference(arr1))
end

a=[1,3,-4,-5,6,8,-3,-5,10,3]
b=[2,8,-4,-7,6,12,-15,-3,1,1]
#puts "Array: #{a}\n"
#puts idxMin(a)
#puts countInterval(a, 5, -1)
#puts betweenMins(a)
#puts countInNums(a, -1, 10)
puts differ2Arrs(a, b)