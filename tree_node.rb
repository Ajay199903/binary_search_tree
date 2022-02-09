require_relative "node"

class TreeNode < Node
  attr_accessor :left_node, :right_node

  def initialize(value)
    super(value)
    @left_node = nil
    @right_node = nil
  end
end
