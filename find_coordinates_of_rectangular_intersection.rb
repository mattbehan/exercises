def find_rectangles rectangle_1, rectangle_2
	if((rectangle_1[bottom_y] + rectangle_1[height] <= rectangle_2[bottom_y]) && 

	end
	rect_1_x_end = rectangle_1[bottom_x] + rectangle_1[width] #(1..7)
	rect_1_x_span = rectangle_1[bottom_x]
	rect_2_x_end = rectangle_2[bottom_x] + rectangle_2[width] #(5..8)
	rect_1_y_end = rectangle_1[bottom_y] + rectangle_1[height] #(1..7)
	rect_2_y_end = rectangle_2[bottom_y] + rectangle_2[height]

	# take the minimum of all sets to get the spans fo the resulting rectangle
end