# ---- PROMPT -----
# A building has 100 floors. One of the floors is the highest floor an egg can be dropped from without breaking.

# If an egg is dropped from above that floor, it will break. If it is dropped from that floor or below, it will be completely undamaged and you can drop the egg again.

# Given two eggs, find the highest floor an egg can be dropped from without breaking, with as few drops as possible.

# ----- Pseudocode -----
# Start at fifth floor
# if egg is good, then go 

# I think there are two valid approaches to this. 

# ---- Solution that is more viable in real world ----
	# Start at floor four, and drop the egg. 
		# If the first egg breaks, then drop the second egg from floor two. 
			# If the second egg also  breaks, then the max floor is 1
			# If the second egg doesn't break, then the max floor was 3
		# If the first egg doesn't break, then we can repeat this process in increments of four.
			# This would have a worst case of 26 drops, where the max floor is from 100-97

# ---- Solution that is more viable if the chance of the egg breaking on any floor is equally likely ----

	# In this solution, since each floor has an equal chance of breaking the egg, we want to guarantee that we find that floor but also minimize the expected number of drops to find the floor.
		# A binary search approach is not optimal here
			# Since we only have two chances at guessing the floor, If the first egg cracks, we will have to go up floor by floor until the second egg cracks. In the case where the actual floor is the 49th floor, you would expect 50 drops.
				# The expected number of drops using this binary approach averages 25 drops if the actual floor is 1-49
				# We would do a little better if the floor is 50-100, however once again it isn't quite log(n), since once the first egg cracks, you have to drop the second egg at each consecutive floor starting from the last safe drop point.
		# A better than binary - but suboptimal approach
			# Drop the egg at every tenth floor. This would have a worst case of 19, where the target floor is the 99th.
		# Optimal approach
			# We want to skip as few floors as possible the first time we drop an egg, so if our first egg breaks right away we don't have a lot of floors to drop our second egg from.
			# We always want to be able to reduce the number of floors we're skipping by one. We don't want to get towards the top and not be able to skip any floors any more.
			
			# We can boil these three points down into an equation, 
			# n * n-1 * n-2 .... + 1 = 100
			# On the left side of the equation, it is clear that we are summing the numbers from 1..n. This arithmetic series boils down to the average of the first and last numbers of the series, however since we don't know the terms, we can simplify it to the sum identity: 1/2 n(n+1) = 100
				# This can be simplified to a quadratic equation: n^2 + 2n - 200 = 0
				# n = 13.651
				# In this case, since we can't use fractional floors... round up to 14

# I'll use these functions to highlight the average difference

def suboptimal_skip_ten_floors max_floor, target_floor
	first_egg_cracked, second_egg_cracked, current_floor, last_safe_floor, last_unsafe_drop, number_drops = false, false, 10, 1, 0, 0
	until first_egg_cracked
		puts "current_floor: #{current_floor}"
		if target_floor >= current_floor && current_floor < max_floor + 1
			number_drops += 1
			last_safe_floor = current_floor
			current_floor += 10
		elsif current_floor > max_floor && target_floor == max_floor
			return number_drops
		elsif target_floor < current_floor
			number_drops += 1
			last_unsafe_drop = current_floor
			current_floor -= 10
			first_egg_cracked = true
		end
	end
	until second_egg_cracked
		# we know the egg will crack on this floor, and don't need to drop it
		return number_drops if last_unsafe_drop -1 == current_floor
		number_drops += 1
		current_floor += 1
		if target_floor + 1 == current_floor
			second_egg_cracked = true
			return number_drops
		end
	end
end

puts suboptimal_skip_ten_floors(100, 100)
puts suboptimal_skip_ten_floors(100, 90)
puts suboptimal_skip_ten_floors(100, 99)

results_array = []
(1..100).each do |x|
	results_array.push(suboptimal_skip_ten_floors(100, x))
end

print results_array
puts "\n"
puts results_array.sum / 100