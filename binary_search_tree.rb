require_relative "node"

class BinarySearchTree
  attr_accessor :root

  def initialize()
    @root = nil
  end

  def add_node(element)
    new_node = Node.new(element)
    if @root.nil?
      @root = new_node
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
        parent.left_node = new_node
      else
        parent.right_node = new_node
      end
    end
  end

  def add_elements(elements)
    if elements.size
      elements.each { |element| add_node(element) }
    end
  end

  def largest_element(node = @root)
    if node
      if node.right_node
        largest_element(node.right_node)
      else
        return node.value
      end
    else
      return nil
    end
  end

  def smallest_element(node = @root)
    if node
      if node.left_node
        smallest_element(node.left_node)
      else
        return node.value
      end
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
    if node
      queue = []
      queue << node
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
    if node
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

