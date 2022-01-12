# TODO
# * Remove Method - Fix next pointer of prev_node remaining after removing data
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
    # Set the data variable to be the head
    data = @head
    # Create loop for displaying each data (until the data is nil)
    until data.nil?
      print "[ #{data.data} | next ] -> "
      data = data.next
    end
    # Mark the end of the linked list
    print "X (nil)\n"
  end

  # Since the list keeps pointers to its head and its tail, the complexity of this method is O(1)
  def insert(data)
    # Create a new data to insert the value into the list
    data = Node.new(data)
    # If head is nil - set the data as head, otherwise append this data after the tail
    !@head ? @head = data : @tail.next = data
    # Set tail to be equal with data
    @tail = data
    # Increment the length counter of the list
    @length += 1
  end

  # Since we may have to traverse the whole list to remove the data, the complexity of this method is O(n)
  # Method to remove given data from the linked list and adjust pointers to keep the elements together
  def remove(data)
    # If data is head of the list
    if data == @head.data
      @head = if @head.next.nil?
                #-- set head and tail to nil if head is the only data in the list
                @tail = nil
              else
                #-- otherwise set the next data to be head
                @head.next
              end
      @length -= 1
    # If data is not head of the list
    else
      # Set the pre_node variable to be the head
      pre_node = @head
      # Loop through the list while there is a pre_node and pre_node.next and they are not the data
      while pre_node.next && pre_node.next.data != data
        pre_node = pre_node.next
      end
      # (Breaks with pre_node = preceding data of the data to be removed)
      # If not found
      not_in_list = pre_node.next.nil?
      unless not_in_list
        # Set the next pointer of pre_node to the next pointer of the data to be removed
        pre_node.next = pre_node.next.next
        # Reduce the length counter of the list
        @length -= 1
      end
    end
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
