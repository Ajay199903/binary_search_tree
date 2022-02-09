require_relative "binary_search_tree"
require_relative "linked_list"

tree = BinarySearchTree.new
linked_list = LinkedList.new

star = ''
dash = ''

65.times do
  star << "*"
  dash << "-"
end 

puts star
puts "Press y or Y to load the bst and linked list from the file"
choice = gets.chomp
if choice.upcase == "Y"
  puts "Loading the BST"
  tree.load_bst
  puts "BST is loaded with the file data"
  puts "Loading the Linked List"
  linked_list.load_linked_list
  puts "Linked List is loaded with the file data"
end
puts star

loop do
  puts star
  puts "Binary Search Tree and Linked List User Interface"
  puts dash
  puts "Binary Search Tree Options"
  puts "1. Add elements into the BST(multiple elements seperated by ,)"
  puts "2. Print largest element in BST"
  puts "3. Print smallest element in BST"
  puts "4. Print Inorder, postorder, level order and preorder traversal"
  puts "5. Search an Element in BST"
  puts "6. Remove an Element of BST"
  puts "7. Print all the paths of BST"
  puts dash
  puts "Linked List Option"
  puts "8. Add elements into the linked list(elements seperated by ,)"
  puts "9. Search an Element in Linked List"
  puts "10. Delete an Element of Linked List"
  puts "11. Reverse the Linked List"
  puts "12. Print the Linked List"
  puts dash
  puts "Enter quit to stop the program"
  puts star
  puts "Enter your choice 1 - 12 or quit"
  choice = gets.chomp
  if choice.upcase == "QUIT"
    tree.store_bst
    linked_list.store_linked_list
    break
  end

  puts dash
  puts star

  case choice
  when "1"
    puts "Enter the elements you want in the BST"
    array = gets.chomp.scan(/\w+/)
    tree.add_elements(array.map(&:to_i))
  
  when "2"
    puts "Largest Element in BST is #{tree.largest_element}"

  when "3"
    puts "Smallest Element in BST is #{tree.smallest_element}"

  when "4"
    puts "In-order Traversal"
    tree.in_order_traversal

    puts "Pre-order Traversal"
    tree.pre_order_traversal

    puts "Post-order Traversal"
    tree.post_order_traversal

    puts "Level-order Traversal"
    tree.level_order_traversal
  
  when "5"
    puts "Enter an element to search in BST"
    element = gets.chomp.to_i
    if tree.search_element(element)
      puts "#{element} is present in the tree"
    else
      puts "#{element} is not present in the tree"
    end

  when "6"
    puts "Enter an element to remove from BST"
    element = gets.chomp.to_i
    tree.remove(element)

  when "7"
    puts "All the paths from the root to leaf node of BST are:"
    tree.print_all_paths

  when "8"
    puts "Enter the elements you want in the linked list"
    array = gets.chomp.scan(/\w+/)
    linked_list.add_elements(array.map(&:to_i))

  when "9"
    puts "Enter an element to search in Linked List"
    element = gets.chomp.to_i
    if linked_list.search_element(element)
      puts "#{element} is present in the linked list"
    else
      puts "#{element} is not present in the linked list"
    end

  when "10"
    puts "Enter an element to remove from linked list"
    element = gets.chomp.to_i
    linked_list.remove_element(element)

  when "11"
    puts "Reversing the linked list"
    linked_list.reverse_linked_list

  when "12"
    puts "Printing the linked list"
    linked_list.print_linked_list

  else
    puts "Enter valid choice"
  end

  puts star
  puts dash
end
