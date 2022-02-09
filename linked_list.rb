require_relative "linked_list_node"

class LinkedList
  attr_accessor :head

  def initialize()
    @head = nil
  end

  def add_node(element)
    new_node = LinkedListNode.new(element)
    if @head.nil?
      @head = new_node
    else
      current = @head
      until current.next_node.nil?
          current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def add_elements(elements)
    if elements.size
      elements.each { |element| add_node(element) }
    end
  end

  def search_element(element, node = @head)
    if node
      if element == node.value
        return true
      else
        return search_element(element, node.next_node)
      end
    else
      return false
    end
  end

  def remove_element(element, node = @head)
    if node
      if node.value == element
        @head = node.next_node
        return
      end
      parent = node
      node = node.next_node
      child = nil
      until node.nil?
        if node.value == element
          child = node.next_node
          parent.next_node = child
          return
        else
          parent = node
          node = node.next_node
        end
      end
    end
  end

  def print_linked_list(node = @head, path = "")
    if node.nil?
      return
    elsif node.next_node.nil?
      puts "#{path}->#{node.value}"
    else
      print_linked_list(node.next_node, path + "->#{node.value}")
    end
  end

  def reverse_linked_list
    parent = nil
    node = @head
    until node.nil?
      child = node.next_node
      node.next_node = parent
      parent = node
      node = child
    end
    @head = parent
  end

  def store_linked_list
    node = @head
    output = []
    until node.nil?
      output << node.value
      node = node.next_node
    end
    File.write("ll.txt", output.join("->"))
  end

  def load_linked_list
    input = File.read("ll.txt").split("->").map(&:to_i)
    add_elements(input)
  end
end
