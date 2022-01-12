require_relative '01_singly_linked_list'

# Initiating a Singly Linked List instance
def sgl_linked_list_init
  puts 'Initiating a Singly Linked List instance'
  test_list = SinglyLinkedList.new
  p test_list
end

# Testing the insert method of a singly linked list
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

  # Raise exceptions for insert method
  raise unless test_list.head.data == 3
  raise unless test_list.head.next.next == test_list.tail
  raise unless test_list.tail.data == 12
  raise unless test_list.tail.next.nil?
  raise unless test_list.length == 3
end


# Testing the remove method of a singly linked list
def testcase_remove
  test_list = sgl_linked_list_init
  test_list.insert(3)
  test_list.insert(24)
  test_list.insert(5)
  test_list.insert(12)
  puts '__ List created'
  test_list.display
  p test_list
  puts ''
  # Removing the head node with data = 3
  test_list.remove(3)
  # # Removing the middle node with data = 24
  # test_list.remove(24)
  # # Removing a node that is not in the list = 1
  # test_list.remove(1)

  puts '__ Removed node 3 and 24'
  # Displaying the singly test list with removed data
  test_list.display
  p test_list
  puts ''
  # Raise exceptions for remove method
end

def testcase_cat
  test_list1 = sgl_linked_list_init
  test_list1.insert(3)
  test_list1.insert(24)
  test_list1.insert(12)
  puts '__ List 1'
  test_list1.display

  test_list2 = sgl_linked_list_init
  test_list2.insert(5)
  test_list2.insert(108)
  puts '__ List 2'
  test_list2.display

  test_list1.cat(test_list2)
  cat_test_list = test_list1
  puts '__ Concatenated List'
  cat_test_list.display
  p cat_test_list

  # Raise exceptions for concatenate method
  raise unless cat_test_list.head.data == 3
  raise unless cat_test_list.length == 5
  raise unless cat_test_list.tail.data == 108
  raise unless cat_test_list.tail.next.nil?
end

puts '>> Insert Test Case'
testcase_insert
puts '>> Remove Test Case'
testcase_remove
# puts '>> Cancatenate 2 Lists Test Case'
# testcase_cat
