require './lib/node'

class BinarySearchTree
  attr_reader :root

  def initialize(root=nil)
    @root  = root
    @level = 0
  end

  def insert(score, title, level=0, current_node=@root)
    @level = level
    if @root.nil?
      @root = Node.new(score, title, @level, current_node)
      @root.depth
    else
      @level += 1
      if score < current_node.score
        if current_node.left_node.nil?
          current_node.left_node = Node.new(score, title, @level, current_node)
          current_node.depth
        else
          insert(score, title, @level, current_node.left_node)
        end
      elsif score > current_node.score
        if current_node.right_node.nil?
          current_node.right_node = Node.new(score, title, @level, current_node)
          current_node.depth
        else
          insert(score, title, @level, current_node)
        end
      end
    end
  end

  def include?(score,current_node=@root)
    if @root.nil?
      return false
    elsif current_node.score == score
      return true
    elsif score < current_node.score
      current_node = current_node.left_node
      if score == current_node
        return true
      else
        include?(score, current_node)
      end
    elsif score > current_node.score
      current_node = current_node.right_node
      if score == current_node.right_node
        return true
      else
        include?(score, current_node)
      end
      return false
    end
  end

end
