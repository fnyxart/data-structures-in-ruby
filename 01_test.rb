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

  # Displaying the singly test list with inserted data
  test_list.display
  p test_list

  # Raise exceptions for insert function
  raise unless test_list.head.data == 3
  raise unless test_list.head.next == test_list.tail
  raise unless test_list.tail.data == 24
  raise unless test_list.tail.next.nil?
  raise unless test_list.length == 2
end

testcase_insert
