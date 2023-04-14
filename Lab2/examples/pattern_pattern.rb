class Pat
	attr_accessor :a, :b

	def initialize(a, b)
		self.a = a
		self.b = b
	end

	def sum_alg
		a+b
	end

	def mult_alg
		a*b
	end

	def minus_alg
		a-b
	end

	def alg
		sum_alg+mult_alg+minus_alg
	end
end

class PatInhetit1 < Pat
	def sum_alg
		a+b+2
	end
end

class PatInhetit2 < Pat
	def mult_alg
		a*b*3
	end
end

pat = Pat.new(4, 2)
pat1 = PatInhetit1.new(4, 2)
pat2 = PatInhetit2.new(4, 2)

puts(pat.alg)
puts(pat1.alg)
puts(pat2.alg)