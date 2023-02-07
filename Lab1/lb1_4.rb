def idxMin(arr)
	return arr.index(arr.min)
end

def countInterval(arr, a, b)
	return arr.values_at(a..b).length
end



a=[1,3,-4,6,8,-3,-5, 10]
#puts "Array: #{a}\n"
#puts idxMin(a)
#puts countInterval(a, 5, -1)