# TODO
# * Remove Method - Fix next pointer of prev_node remaining after removing node
# * Cat Method - Fix head and tail variables

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

  # Since we may have to traverse the whole list to remove the node, the complexity of this method is O(n)
  # Method to remove given node from the linked list and adjust pointers to keep the elements together
  def remove(node)
    # If no node with given data exists in the list, return nil
    return nil unless node

    # If node is head of the list
    if node == @head
      @head = if @head.next.nil?
                #-- set head and tail to nil if head is the only node in the list
                @tail = nil
              else
                #-- otherwise set the next node to be head
                @head.next
              end
    # If node is not head of the list
    else
      # Set the pre_node variable to be the head
      pre_node = @head
      # Loop through the list while there is a pre_node and pre_node.next and they are not the node
      pre_node = pre_node.next while pre_node && pre_node.next != node
      # (Breaks with pre_node = preceding node of the node to be removed)
      # Set the next pointer of pre_node to the next pointer of the node to be removed
      pre_node.next = node.next if pre_node
    end
    # Reduce the length counter of the list
    @length -= 1
  end

  # Method to join two lists, O(1)
  def cat(list)
    return nil unless list

    # Set the next pointer of the tail of 1st list to head of 2nd list
    @tail.next = list.head
    # Add the new list length to the length counter
    @length += list.length
  end
end

## Node; used in a singly linked list class
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end
