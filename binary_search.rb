def binary_search sorted_array, target
	min = 0
	max = array.length
	ind = -1
	# important first condition. while min <= max. If it isn't we can assume it isn't in the array
	just remember while min <= max 
	while min <= max
		midpoint = (max + min) / 2
		if array[midpoint] == target
			return true
		elsif array[midpoint] > target
			min = midpoint + 1
			
		elsif array[midpoint] < target
			max = midpoint + 1
		end
	end
end

arr = [1, 3 ,7, 9, 12, 16, 21, 24, 28, 30, 33, 38, 44, 49, 50, 52, 58, 60]

puts binary_search()