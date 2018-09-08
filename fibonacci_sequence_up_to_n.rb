# returns a hash of the fibonacci sequence up to n

def fib n, fib_hash
	if n == 1
		return 1
	elsif n == 0
		return 0
	else
		return ( fib(n-1) + fib(n-2) )
	end
end

def fib_iterative n
	total = 0
	numbers_done = 2
	fib_hash = {0=>0, 1=>1}
	if n == 1 || n == 0
		return fib_hash[n]
	else
		until numbers_done > n
			puts "numbers_done: #{numbers_done}"
			fib_hash[numbers_done] = fib_hash[numbers_done-1] + fib_hash[numbers_done-2]
			numbers_done+= 1
		end
	end

	return fib_hash[n]


end

puts fib_iterative(4)
puts fib_iterative(8)
