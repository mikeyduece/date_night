require './lib/node'

class BinarySearchTree
  attr_reader :root

  def initialize(root=nil)
    @root = root
  end

  def left
    current = @root
    current = current.left_node
  end

  def right
    current = @root
    current = current.right_node
  end

  def insert(score, title)
    if root.nil?
      @root = Node.new(score, title)
    else
      current = @root
      left if root.score < score
      right if root.score > score
    end

  end
end
