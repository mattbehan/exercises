Class QueueWithTwoStacks

	def initialize
		@in_stack =[]
		@out_stack =[]
	end

	def enqueue item
		@in_stack.push()
	end

	def dequeue
		@in_stack.each do |item|
			@out_stack.push(@in_stack.pop())
		end
		@in_stack.push(@out_stack.pop())
		return @in_stack.pop()
	end

	def dequeue_linear_time
		if @in_stack.length == 0 && @out_stack.length == 0
			return nil
		elsif @out_stack.length > 0
			return @out_stack.pop()
		else
			@in_stack.each do |item|
				@out_stack.push(@in_stack.pop())
			end
			@out_stack.pop()
		end


	end
end