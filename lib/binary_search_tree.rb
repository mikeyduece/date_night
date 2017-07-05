require './lib/node'

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root   = nil
    @level  = 0
    @sorted = []
  end

  def insert(score, title, level = 0, current = @root)
    @level = level
    if @root.nil?
      @root = Node.new(score, title, @level)
      @root.depth
    else
      @level += 1
      if score < current.score
        if current.left.nil?
          current.left = Node.new(score, title, @level, current.left)
          current.depth
        else
          insert(score, title, @level, current.left)
        end
      elsif score > current.score
        if current.right.nil?
          current.right = Node.new(score, title, @level, current.right)
          current.depth
        else
          insert(score, title, @level, current.right)
        end
      end
    end
  end

  def search(score, current = @root)
    if current.nil?
      return false
    elsif score == current.score
      current
    elsif score < current.score
      search(score, current.left)
    elsif score > current.score
      search(score, current.right)
    end
  end

  def include?(score)
    search(score)
  end

  def depth_of(score)
    search(score).depth
  end

  def max(current = @root)
    data = {}
    until current.right.nil?
      current = current.right
    end
    data[current.title] = current.score
    data
  end

  def min(current = @root)
    data = {}
    until current.left.nil?
      current = current.left
    end
    data[current.title] = current.score
    data
  end

  def sort(current = @root)
    if current.left != nil
      sort(current.left)
    end
    @sorted << {current.title => current.score}
    if current.right != nil
      sort(current.right)
    end
    @sorted
  end

  def load#(filename)
    @count = 0
    filename ||= "./movies.txt"
    File.foreach filename do |line|
      data = line.chomp.split(",",2)
      if include?(data[0].to_i) == true
        nil
      else
        @count += 1
        insert(data[0].to_i, data[1])
      end
    end
    @count
  end
end
