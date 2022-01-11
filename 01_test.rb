require_relative '01_singly_linked_list'

# Initiating a Singly Linked List instance
def sgl_linked_list_init
  puts 'Initiating a Singly Linked List instance'
  test_list = SinglyLinkedList.new
  p test_list
end

# Testing the insert function of a singly linked list
def testcase_insert
  test_list = sgl_linked_list_init
  # Inserting a new node with data = 3
  test_list.insert(3)
  # Inserting a new node with data = 24
  test_list.insert(24)
  # Inserting a new node with data = 12
  test_list.insert(12)

  # Displaying the singly test list with inserted data
  test_list.display
  p test_list

  # Raise exceptions for insert function
  raise unless test_list.head.data == 3
  raise unless test_list.head.next.next == test_list.tail
  raise unless test_list.tail.data == 12
  raise unless test_list.tail.next.nil?
  raise unless test_list.length == 3
end


# Testing the remove function of a singly linked list
def testcase_remove
  test_list = sgl_linked_list_init
  test_list.insert(3)
  test_list.insert(24)
  test_list.insert(12)
  # # Removing the node with data = 3 (head)
  # test_list.remove(3)
  # Removing the node with data = 12 (tail)
  test_list.remove(24)
  # # Removing a node that is not in the list = 1
  # test_list.remove(1)

  # Displaying the singly test list with removeed data
  test_list.display
  p test_list

  # Raise exceptions for remove function
end

testcase_insert
testcase_remove
