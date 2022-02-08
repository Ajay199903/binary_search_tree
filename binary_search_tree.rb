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

  def add_elements(*elements)
    if elements.size
      elements.each { |element| add_node(element) }
    end
  end

  def inorder_traversal(node = @root)
    unless node.nil?
      inorder_traversal(node.left_node)
      puts " #{node.value} "
      inorder_traversal(node.right_node)
    end
  end
end


tree = BinarySearchTree.new

tree.add_elements(2,5,3,4,1)
tree.inorder_traversal

