def vzaimProst(num1, num2)
	if(num1.gcd(num2)==1) then true
		else false
	end
end

def meth1(num1)
	return (2.upto(num1-1).select {|e| num1.gcd(e)==1}).length
end

puts meth1(16)
