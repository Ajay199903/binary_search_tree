class Node
  attr_accessor :value, :left_node, :right_node

  def initialize(value)
    @value = value
    @left_node = nil
    @right_node = nil
  end
end

class BinarySearchTree
  attr_accessor :root

  def initialize()
    @root = nil
  end

  def add_node(element)
    if @root.nil?
      @root = Node.new(element)
    else
      parent = nil
      current = @root
      until current.nil?
        parent = current
        if element < current.value
          current = current.left_node
        else
          current = current.right_node
        end
      end
      if element < parent.value
        parent.left_node = Node.new(element)
      else
        parent.right_node = Node.new(element)
      end
    end
  end

  def add_elements(elements)
    if elements.size
      elements.each { |element| add_node(element) }
    end
  end

  def largest_element(node = @root)
    unless node.nil?
      unless node.right_node.nil?
        largest_element(node.right_node)
      else
        return node.value
      end
    else
      return nil
    end
  end

  def smallest_element(node = @root)
    unless node.nil?
      unless node.left_node.nil?
        smallest_element(node.left_node)
      else
        return node.value
      end
    else
      return nil
    end
  end

  def in_order_traversal(node = @root)
    unless node.nil?
      in_order_traversal(node.left_node)
      puts " #{node.value} "
      in_order_traversal(node.right_node)
    end
  end

  def pre_order_traversal(node = @root)
    unless node.nil?
      puts " #{node.value} "
      pre_order_traversal(node.left_node)
      pre_order_traversal(node.right_node)
    end
  end

  def post_order_traversal(node = @root)
    unless node.nil?
      post_order_traversal(node.left_node)
      post_order_traversal(node.right_node)
      puts " #{node.value} "
    end
  end

  def level_order_traversal
    node = @root
    unless node.nil?
      queue = []
      queue << node
      until queue.empty?
        node = queue.shift
        puts " #{node.value} "
        unless node.left_node.nil?
          queue << node.left_node
        end
        unless node.right_node.nil?
          queue << node.right_node
        end
      end
    end
  end

  def search_element(element, node = @root)
    unless node.nil?
      if element < node.value
        return search_element(element, node.left_node)
      elsif element > node.value
        return search_element(element, node.right_node)
      else
        return true
      end
    else
      return false
    end
  end

  def remove_element(element, node = @root)
    unless node.nil?
      if element < node.value
        node.left_node = remove_element(element, node.left_node)
      elsif element > node.value
        node.right_node = remove_element(element, node.right_node)
      else
        if node.left_node != nil && node.right_node != nil
          min_right = smallest_element(node.right_node)
          node.value = min_right
          node.right_node = remove_element(min_right, node.right_node)
        elsif node.left_node != nil
          node = node.left_node
        elsif node.right_node != nil
          node = node.right_node
        else
          node = nil
        end
      end
      return node
    end
    return nil
  end

  def remove(element)
    @root = remove_element(element, @root)
  end
end


tree = BinarySearchTree.new

loop do
  puts "Binary Search Tree User Interface"
  puts "1. Add elements into the tree(multiple elements seperated by ,)"
  puts "2. Print largest element"
  puts "3. Print smallest element"
  puts "4. Print Inorder, postorder, level order and preorder traversal"
  puts "5. Search an Element"
  puts "6. Remove an Element"
  puts "Enter quit to stop the program"
  puts "Enter your choice 1 - 6 or quit"
  choice = gets.chomp
  break if choice.upcase == "QUIT"

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

  else
    puts "Enter valid choice"
  end
end
