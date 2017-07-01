require './lib/node'

class BinarySearchTree
  attr_reader :root

  def initialize(root=nil)
    @root = root
  end

  def insert(score, title, current_node=@root, level=0)
    @level = level
    if @root.nil?
      @root = Node.new(score, title, @level)
      @root.depth
    else
      @level += 1
      if score < current_node.score
        if current_node.left_node.nil?
          current_node.left_node = Node.new(score, title, current_node, @level)
          current_node.left_node.depth
        else
          insert(score, title, current_node.left_node, @level)
        end
      elsif score > current_node.score
        if current_node.right_node.nil?
          current_node.right_node = Node.new(score,title,current_node,@level).depth
        else
          insert(score, title, current_node.right_node,@level).depth
        end
      end
    end
  end

end
