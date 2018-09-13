# Write a method for reversing a linked list. ↴ Do it in place. ↴

# Your method will have one input: the head of the list.

# Your method should return the new head of the list.

# Here's a sample linked list node class:

class LinkedListNode

  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next  = nil
  end
end


# here's my solution
# we want to walk through the list from the head, and wherever there set the next to our stored variable for prev. If our stored variable for prev has no value node, then it was the previous head of the list. If node.next had no value, then it is the new head of the list 
# while moving from node to node, all we need to do is say ok we're at the next node, for this node next = prev, but first we must store the actual next node so it doesn't disappear. 
def reverse_list(head)
	current_node, previous_node, next_node = head, nil, nil 

	while current_node do 
		next_node = current_node.next
		current_node.next = previous_node
		# load the next nodes for next iteration
		previous_node = current_node
		current_node = next_node
	end
	return previous_node

end

 # make sure to test for edge cases where there are 1 and 0 nodes