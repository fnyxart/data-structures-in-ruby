require_relative '01_singly_linked_list'

# Initiating a Singly Linked List instance
def sgl_linked_list_init
  puts ''
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

  puts '__ List created'
  test_list.display
  p test_list
  puts ''
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
  test_list.insert(8)
  test_list.insert(24)
  test_list.insert(5)
  test_list.insert(12)
  puts '__ List created'
  test_list.display
  p test_list
  puts ''
  # Removing the head node with data = 3
  test_list.remove(3)
  # Removing the middle node with data = 24
  test_list.remove(24)
  # Removing a node that is not in the list = 1
  test_list.remove(1)
  # Removing the tail node with data = 12
  test_list.remove(12)

  puts '__ Removed node 3(head), 24(middle), 1(not in list) and 12(tail)'
  # Displaying the singly test list with removed data
  test_list.display
  p test_list

  # Raise exceptions for remove method
  raise unless test_list.head.data == 8
  raise unless test_list.length == 2
  raise unless test_list.head.next == test_list.tail
  raise unless test_list.tail.data == 5
  raise unless test_list.tail.next.nil?
end

# Testing the remove and concatenating methods on empty list
def testcase_rem_cat_empty_list
  test_list = sgl_linked_list_init
  puts "List 1 - #{test_list}"
  test_list2 = sgl_linked_list_init
  puts "List 2 - #{test_list2}"
  test_list3 = sgl_linked_list_init
  test_list3.insert(3)
  puts '__ Added node with 3 in List 3'
  test_list3.display
  p test_list3
  puts ''
  puts '__ Removing node with data 20 from empty list 1'
  # Trying to remove a node from an empty list
  test_list.remove(20)
  puts '__ Concatenating empty list 1 and empty list 2'
  test_list.cat(test_list2)
  puts '__ Concatenating list 3 and empty list 2'
  test_list3.cat(test_list2)
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
  puts ''

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

def testcase_clear
test_list = sgl_linked_list_init
  test_list.insert(3)
  test_list.insert(5)
  test_list.insert(12)
  puts '__ List created'
  test_list.display
  p test_list
  puts ''
  test_list.clear
  puts '__ List cleared'
  p test_list
  puts ''
end

puts '>> Insert Test Case'
testcase_insert
puts ''
puts '>> Remove Test Case'
testcase_remove
puts ''
puts '>> Cancatenate 2 Lists Test Case'
testcase_cat
puts ''
puts '>> Remove from and Cancatenate an Empty List Test Case'
testcase_rem_cat_empty_list
puts ''
puts '>> Clear List Test Case'
testcase_clear
puts ''
