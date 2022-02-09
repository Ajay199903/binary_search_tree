require_relative "node"

class LinkedListNode < Node
  attr_accessor :next_node

  def initialize(value)
    super(value)
    @next_node = nil
  end
end
