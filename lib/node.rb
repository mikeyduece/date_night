class Node
  attr_reader :score, :title
  attr_accessor :depth, :right_node, :left_node


  def initialize(score,title,depth=nil,left_node=nil,right_node=nil)
    @score      = score
    @title      = title
    @depth      = depth
    @left_node  = left_node
    @right_node = right_node
  end
end
