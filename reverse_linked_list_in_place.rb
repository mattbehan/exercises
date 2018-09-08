# Write a method for reversing a linked list. ↴ Do it in place. ↴

# Your method will have one input: the head of the list.

# Your method should return the new head of the list.

# Here's a sample linked list node class:

class LinkedListNode

	attr_accessor :value, :next

	def initialize(value, next1=nil)
		@value = value
		@next  = next1
	end
end


# here's my solution
# we want to walk through the list from the head, and wherever there set the next to our stored variable for prev. If our stored variable for prev has no value node, then it was the previous head of the list. If node.next had no value, then it is the new head of the list 
# while moving from node to node, all we need to do is say ok we're at the next node, for this node next = prev, but first we must store the actual next node so it doesn't disappear. 
  def reverse_list(head_of_list)
  current_node = head_of_list
  previous_node = nil
  next_node = nil

  # until we have 'fallen off' the end of the list
  while current_node

    # copy a pointer to the next element
    # before we overwrite current_node.next
    next_node = current_node.next

    # reverse the 'next' pointer
    current_node.next = previous_node

    # step forward in the list
    previous_node = current_node
    current_node = next_node
  end

  return previous_node
end

x = []
y = nil
[*1..5].each do |val|
	if val > 1
		prev = y
		y = LinkedListNode.new(val, prev)
		x.push(y)
	else
		y=LinkedListNode.new(val, y)
		x.push(y)
	end

	# x.push( val > 1 ? LinkedListNode.new(val, x[val -1]) : LinkedListNode.new(value: val, next: nil) )
	puts x[val-1]
end

puts "====starting reverse list====="
puts "x is: "
x.each do |elem|
	puts elem.inspect
end
puts "\n======\n"
reverse_list(x[4])
x.each do |elem|
	puts elem.inspect
end



 # make sure to test for edge cases where there are 1 and 0 nodes