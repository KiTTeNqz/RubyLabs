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

a=[1,3,-4,6,8,-3,-5, 10]
puts minArr(a)
puts firstPos(a)