class Node
  attr_reader :score, :title
  attr_accessor :depth, :right, :left


  def initialize(score,title,depth=nil,left=nil,right=nil)
    @score = score
    @title = title
    @depth = depth
    @left  = left
    @right = right
  end
end
