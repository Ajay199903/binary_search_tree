require_relative "binary_search_tree"

tree = BinarySearchTree.new

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
end
puts star

loop do
  puts star
  puts "Binary Search Tree User Interface"
  puts "1. Add elements into the tree(multiple elements seperated by ,)"
  puts "2. Print largest element"
  puts "3. Print smallest element"
  puts "4. Print Inorder, postorder, level order and preorder traversal"
  puts "5. Search an Element"
  puts "6. Remove an Element"
  puts "7. Print all the paths"
  puts "Enter quit to stop the program"
  puts star
  puts "Enter your choice 1 - 7 or quit"
  choice = gets.chomp
  if choice.upcase == "QUIT"
    tree.store_bst
    break
  end

  puts dash
  puts star

  case choice
  when "1"
    puts "Enter the elements you want in the tree"
    array = gets.chomp.scan(/\w+/)
    tree.add_elements(array.map(&:to_i))
  
  when "2"
    puts "Largest Element is #{tree.largest_element}"

  when "3"
    puts "Smallest Element is #{tree.smallest_element}"

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
    puts "Enter an element to search"
    element = gets.chomp.to_i
    if tree.search_element(element)
      puts "#{element} is present in the tree"
    else
      puts "#{element} is not present in the tree"
    end

  when "6"
    puts "Enter an element to remove"
    element = gets.chomp.to_i
    tree.remove(element)

  when "7"
    puts "All the paths from the root to leaf node are:"
    tree.print_all_paths

  else
    puts "Enter valid choice"
  end

  puts star
  puts dash
end
