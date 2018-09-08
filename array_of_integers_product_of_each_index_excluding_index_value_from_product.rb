# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.

# Write a method get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.

def integer_products integers
	# use each with index to loop through integers and find product of all other integers
	# better solution:
	# create an array that corresponds to the product of each integer before each index, and an array of the product of each integer after each index
	product_so_far = 1
	products_before_index = []
	integers.each_with_index do |int, index|
		products_before_index[index] = product_so_far
		product_so_far*= integers[index]
	end

	products_after_index = []
	product_so_far = 1
	i = integers.length - 1
	while i >= 0
		products_after_index[i] = product_so_far
		product_so_far*= integers[i]
		i-= 1
	end

	return [products_before_index, products_after_index]

end

# we can take this solution and make it better by not storing the second array.
# Once we get the first array, we can just multiply it by whatever was in the first array and replace the first arrays value with that, since we won't need that value anymore

# Takeaways from this are 

integers =   [1, 7, 3, 4]

print integer_products(integers)