def merge_ranges_brute_force meeting_times
	# for each range, look to see if another range has any overlap with it, if so, remove the second range and replace the first ranges end time with the second

end

def merge_ranges meeting_times
	meeting_times.sort_by!{|meeting_1| meeting_1[1] }
	print meeting_times
	# here we initialize merged meetings to be the first value of meeting times
	# this simplifies the looping through the arrays so we don't have to add a special case when looping
	# through meeting_times for the first case
	merged_meetings = [meeting_times[0]]
	meeting_times[1..-1].each do |current_meeting_start, current_meeting_end|
		# last_merged_meeting_start = merged_meetings[-1][0]
		# last_merged_meeting_start = merged_meetings[-1][1]
		# we can simplify these two statements by assigning two variables to the first value of merged_meetings
		last_merged_meeting_start,last_merged_meeting_end = merged_meetings[-1]
		puts "last_merged_meeting_end #{last_merged_meeting_end}"
		puts "current_meeting_start #{current_meeting_start}"

		# if start time of first meeting in between start and end time of second, and end time of second >= end time of first the meetings should be merged
		# since we've sorted by the end time, we can just make the end time of the merged meeting equal to the end time of the second meeting
		# we should set the start time of the merged meeting equal to the lesser of the two start times
		if current_meeting_start >= last_merged_meeting_start && current_meeting_start <= last_merged_meeting_end
			merged_meetings[-1] = [[last_merged_meeting_start,current_meeting_start].min , current_meeting_end]
		else
			merged_meetings.push([current_meeting_start, current_meeting_end])
		end
	end
	return merged_meetings
end


meetings =   [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

print merge_ranges(meetings)