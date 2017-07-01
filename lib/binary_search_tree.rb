require './lib/node'

class BinarySearchTree
  attr_reader :root

  def initialize(root=nil)
    @root = root
  end

  def insert(score, title, level=0, current_node=@root)
    @level = level
    if @root.nil?
      @root = Node.new(score, title, @level)
      @root.depth
    else
      @level += 1
      if score < current_node.score
        if current_node.left_node.nil?
          current_node.left_node = Node.new(score, title, @level, current_node)
          current_node.left_node.depth
        else
          insert(score, title, @level, current_node.left_node)
        end
      elsif score > current_node.score
        if current_node.right_node.nil?
          current_node.right_node = Node.new(score, title, @level, current_node)
          current_node.right_node.depth
        else
          insert(score, title, @level, current_node.right_node).depth
        end
      end
    end
  end

end
