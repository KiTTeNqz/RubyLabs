#var2
def vzaimProst(num1, num2)
	if(num1.gcd(num2)==1) then true
		else false
	end
end

def formArrDel(num)
	return 1.upto(num).select{|e| num%e==0}
end

def meth1(num1)
	return 2.upto(num1-1).count{|e| num1.gcd(e)==1}
end

def meth2(num)
	return num.digits.select{|e| e%3==0}.sum
end

def meth3(num)
	#formirovat massiv iz kol-va vzaimno-prostih s dannim
	arr = formArrDel(num).map{|e| num.digits.count{|e1| e.gcd(e1)==1}}
	return formArrDel(num)[arr.rindex(arr.max)]
end

puts meth1(16)
puts meth2(161718192023)
puts meth3(17)