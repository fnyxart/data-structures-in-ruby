# TODO
# * Add Node class
# * Write script with examples

## Single-linked list data structure
class SinglyLinkedList
  attr_accessor :head, :tail
  attr_reader :length

  # The complexity of this method is O(1)
  def initialize
    # Create an empty list, with nil head and tail, and list length as 0
    @head = nil
    @tail = nil
    @length = 0
  end

  # Since the list keeps pointers to its head and its tail, the complexity of this method is O(1)
  def insert(data)
    # Create a new node to insert the value into the list
    node = Node.new(data)
    # If head is nil - set the node as head, otherwise append this node after the tail
    !@head ? @head = node : @tail.next = node
    # Set tail to be equal with node
    @tail = node
    # Increment the length counter of the list
    @length += 1
  end

  # Method to display the linked list and its nodes, the complexity is O(n)
  def display
    puts "Singly linked list length = #{@length}"
    # Set the node variable to be the head
    node = @head
    # Create loop for displaying each node (until the node is nil)
    until node.nil?
      print "[ #{node.data} | next ] -> "
      node = node.next
    end
    # Mark the end of the linked list
    print "X (nil)\n"
  end
end

## Node; used in a singly linked list class
class Node
  attr_reader :data
  attr_accessor :next

  def initialize(data)
    @data = data
    @next = nil
  end
end
