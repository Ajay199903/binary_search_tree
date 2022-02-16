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
      while current.next_node
          current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def add_elements(elements)
    elements.each { |element| add_node(element) }
  end

  def search_element(element, node = @head)
    if node
      return true if element == node.value
      return search_element(element, node.next_node)
    else
      return false
    end
  end

  def remove_element(element, node = @head)
    if node
      if node.value == element
        @head = node.next_node
        return true
      end
      parent = node
      node = node.next_node
      child = nil
      while node
        if node.value == element
          child = node.next_node
          parent.next_node = child
          return true
        else
          parent = node
          node = node.next_node
        end
      end
    end
    return false
  end

  def print_linked_list(node = @head, path = "")
    return if node.nil?
    if node.next_node 
      print_linked_list(node.next_node, path + "->#{node.value}")
    else
      puts "#{path}->#{node.value}"
    end
  end

  def reverse_linked_list
    parent = nil
    node = @head
    while node
      child = node.next_node
      node.next_node = parent
      parent = node
      node = child
    end
    @head = parent
    puts "Linked List Reversed Successfully"
  end

  def store_linked_list
    node = @head
    output = []
    while node
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
