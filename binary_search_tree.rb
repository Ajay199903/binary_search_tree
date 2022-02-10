require_relative "tree_node"

class BinarySearchTree
  attr_accessor :root

  def initialize()
    @root = nil
  end

  def add_node(element)
    new_node = TreeNode.new(element)
    if @root.nil?
      @root = new_node
    else
      parent = nil
      current = @root
      while current
        parent = current
        current = element < current.value ? current.left_node : current.right_node
      end
      element < parent.value ? parent.left_node = new_node : parent.right_node = new_node
    end
  end

  def add_elements(elements)
      elements.each { |element| add_node(element) }
  end

  def largest_element(node = @root)
    if node
      return largest_element(node.right_node) if node.right_node
      return node.value
    else
      return nil
    end
  end

  def smallest_element(node = @root)
    if node
      return smallest_element(node.left_node) if node.left_node
      return node.value
    else
      return nil
    end
  end

  def in_order_traversal(node = @root)
    if node
      in_order_traversal(node.left_node)
      puts " #{node.value} "
      in_order_traversal(node.right_node)
    end
  end

  def pre_order_traversal(node = @root)
    if node
      puts " #{node.value} "
      pre_order_traversal(node.left_node)
      pre_order_traversal(node.right_node)
    end
  end

  def post_order_traversal(node = @root)
    if node
      post_order_traversal(node.left_node)
      post_order_traversal(node.right_node)
      puts " #{node.value} "
    end
  end

  def level_order_traversal
    node = @root
		# if node is required because [nil] is considered not empty
		if node
    	queue = []
    	queue << node
			# Negation required because queue = [] is considered true value
    	until queue.empty?
      	node = queue.shift
      	puts " #{node.value} "
      	if node.left_node
        	queue << node.left_node
      	end
      	if node.right_node
        	queue << node.right_node
      	end
    	end
		end
  end

  def search_element(element, node = @root)
    if node
      return search_element(element, node.left_node) if element < node.value
      return search_element(element, node.right_node) if element > node.value
      return true
    else
      return false
    end
  end

  def remove_element(element, node = @root)
    if node
			found = false
      if element < node.value
        node.left_node, found = remove_element(element, node.left_node)
      elsif element > node.value
        node.right_node, found  = remove_element(element, node.right_node)
      else
				found = true
        if node.left_node && node.right_node
          min_right = smallest_element(node.right_node)
          node.value = min_right
          node.right_node, found = remove_element(min_right, node.right_node)
        elsif node.left_node
          node = node.left_node
        elsif node.right_node
          node = node.right_node
        else
          node = nil
        end
      end
      return node, found
    end
    return nil, false
  end

  def remove(element)
    @root, found = remove_element(element, @root)
		puts "#{element} deleted from BST" if found
		puts "#{element} not found in BST" if !found
  end

  def print_all_paths(node = @root, path = "")
    return if node.nil?
    print_all_paths(node.left_node, path + "->#{node.value}") if node.left_node
    print_all_paths(node.right_node, path + "->#{node.value}") if node.right_node
		puts "#{path}->#{node.value}"  if node.left_node.nil? && node.right_node.nil?
  end

  def store_bst
    node = @root
    output = []
    if node
      queue = []
      queue << node
      output << node.value
      until queue.empty?
        node = queue.shift
        if node.left_node
          queue << node.left_node
          output << node.left_node.value
        else
          output << -1
        end
        if node.right_node
          queue << node.right_node
          output << node.right_node.value
        else
          output << -1
        end
      end
    else
      output << -1
    end
    File.write("bst.txt", output.join("->"))
  end

  def load_bst
    input = File.read("bst.txt").split("->").map(&:to_i)
    unless input.first == -1
      queue = []
      @root = TreeNode.new(input.first)
      node = @root
      itr = 1
      queue << node
      until itr >= input.size
        node = queue.shift
        unless input[itr] == -1
          node.left_node = TreeNode.new(input[itr])
          queue << node.left_node
        end
        unless input[itr + 1] == -1
          node.right_node = TreeNode.new(input[itr + 1])
          queue << node.right_node
        end
        itr += 2
      end
    end
  end
end
