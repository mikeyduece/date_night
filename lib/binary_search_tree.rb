require './lib/node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root   = nil
    @level  = 0
    @sorted = []
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
          current_node.left_node = Node.new(score, title, @level, current_node.left_node)
          current_node.depth
        else
          insert(score, title, @level, current_node.left_node)
        end
      elsif score > current_node.score
        if current_node.right_node.nil?
          current_node.right_node = Node.new(score, title, @level, current_node.right_node)
          current_node.depth
        else
          insert(score, title, @level, current_node.right_node)
        end
      end
    end
  end

   def include?(score, current_node=@root)
    if current_node.nil?
      false
    elsif score == current_node.score
      true
    elsif score < current_node.score
      current_node = current_node.left_node
      include?(score, current_node)
    elsif score > current_node.score
      current_node = current_node.right_node
      include?(score, current_node)
    end
  end

  def depth_of(score, current_node=@root)
    if current_node.nil?
      return "That score does not exist"
    elsif score == current_node.score
      current_node.depth
    elsif score < current_node.score
      current_node = current_node.left_node
      depth_of(score, current_node)
    elsif score > current_node.score
      current_node = current_node.right_node
      depth_of(score, current_node)
    end
  end

  def max(current_node=@root)
    data = {}
    if current_node.right_node != nil
      current_node = current_node.right_node
      max(current_node)
    else
      data[current_node.title] = current_node.score
      data
    end
  end

  def min(current_node=@root)
    data = {}
    if current_node.left_node != nil
      current_node = current_node.left_node
      min(current_node)
    else
      data[current_node.title] = current_node.score
      data
    end
  end

  def sort(current_node=@root)
    if current_node.left_node != nil
      sort(current_node.left_node)
    end
    @sorted << {current_node.title => current_node.score}
    if current_node.right_node != nil
      sort(current_node.right_node)
    end
    @sorted
  end

  def load(filename)
    count = 0
    filename = "./movies.txt"
    File.foreach filename do |line|
      data = line.chomp.split(",")
      insert(data[0].to_i, data[1])
      count += 1
    end
    count
  end
end
