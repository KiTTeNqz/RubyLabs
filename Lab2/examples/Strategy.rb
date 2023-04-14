class Strategy
	def execute
		raise NotImplementedError, 'Определён в наследниках'
	end
end

class Strategy1 < Strategy
	def execute
		puts 'Doing Strategy1...'
	end
end

class Strategy2 < Strategy
	def execute
		puts 'Doing Strategy2...'
	end
end

class Context
	attr_accessor :strategy

	def initialize(strategy)
		self.strategy=strategy
	end

	def execute_strategy
		strategy.execute
	end

end

strategy1 = Strategy1.new
context = Context.new(strategy1)
context.execute_strategy

strategy2 = Strategy2.new
context.strategy = strategy2
context.execute_strategy