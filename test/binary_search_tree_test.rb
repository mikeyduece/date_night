require './test/test_helper'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  attr_reader :tree

  def setup
    @tree = BinarySearchTree.new
  end

  def test_it_exists
    assert_equal BinarySearchTree, tree.class
  end

  def test_it_has_a_root_node
    assert_nil tree.root
  end

  def test_it_can_insert_a_movie_with_title_and_score_and_return_depth
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, tree.root.score
    assert_equal "Bill & Ted's Excellent Adventure", tree.root.title
    assert_equal 0, tree.root.depth
  end

  def test_it_can_insert_to_the_left
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    assert_equal 16, tree.root.left_node.score
    assert_equal "Johnny English", tree.root.left_node.title
    assert_equal 1, tree.root.left_node.depth
  end

end

# tree.insert(16, "Johnny English")
# # => 1
# tree.insert(92, "Sharknado 3")
# # => 1
# tree.insert(50, "Hannibal Buress: Animal Furnace")
# # => 2
