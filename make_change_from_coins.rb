def find_change amount, denominations
	# go through each denomination and while denomination is less
	possibilities = []
	@solutions = []
	possibilities_added = {}
	denominations.each do |denomination|

	end
	denominations.each do |denomination|
		if denomination < amount
			possibilities.push([denomination])
		elsif denomination == amount
			@solutions.push([denomination])
		end
		possibilities.each do |possibility|
			new_possibility = possibility.dup
			new_possibility << denomination
			possibilities_added_key = new_possibility.sort.join(",")
			sum = new_possibility.sum
			next if sum > amount
			# next if possibilities_added.include?(possibilities_added_key)
			if sum < amount
				possibilities.push(new_possibility)
				possibilities_added[possibilities_added_key] = 1
			elsif sum == amount
				print new_possibility
				puts "adding new solution"
				new_solution = new_possibility.dup
				@solutions.push(new_solution)
				print @solutions
				print ""
			end
		end
			puts" solutions here is"
			print @solutions
	end
	puts " returning the following solutions"
	print @solutions
	puts ""
	print possibilities
	puts ""
	return @solutions

end


# could use a hash and sort the keys


def find_change_with_hash amount, denominations
	# go through each denomination and while denomination is less
	possibilities = {}
	solutions = []
	denominations.each do |denomination|
		if denomination < amount
			possibilities[denomination] = denomination 
		elsif denomination == amount
			solutions.push(denomination)
		end
	end

	possibilities.each do |possibility|
		denomination.each do |denom|
			
		end
	end

end

# takeaways
# learned if you are dynamically adding to an array, you cannot add an existing variable directly to the array. If the variable you are adding to the array was created by direct assignment from another variable, then it will point to the other variable, and when the other variable changes, so will the value in the dyanmic array.
# Also learned that this isn't the best way to do a change problem. The best way to do it is to actually start bottom up and create the solution for each sequential value, starting at the smallest, and use the previous values to do so
# you can create a range of values to iterate over that are variables by doing (x..y).each do |thing|
# we saw this in this example in (coin..amount).each do

def find_change_bottom_up amount, denominations

	solutions = []

	# first index equals the current amount, solution
	# second index stores the possibilites to get that amount
	# as the first index increases, when trying to calculate the second index (the ways to make change using only the xth coin), you can use the previous coins values at lower indices (e.g. if you are on the third coin and trying to see ways you can make change for 3, the previous coins values would show that there is one way [1cent] to make 1cent of change, two ways to make 2cents [[1cent, 1cent], [2cent]] ) 
	# [:coin_amount][:index_of_way_to_make_change][:array that shows how to make change]
	# [ [1],[1,1],[1,1,1],[1,1,1,1],[1,1,1,1,1] ]
	# [ [1], [[2,1], [1,1]], [[1,1]] ]
	indexed_solutions_for_n_cents = [[[]]]



end


x = find_change(10	, [1,2,3])
puts "found change"
print x