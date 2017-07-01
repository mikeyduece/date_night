require './test/test_helper'
require './lib/node'

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal Node, node.class
  end

  def test_it_can_have_a_score
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal 61, node.score
  end

  def test_it_can_have_a_different_score
    node = Node.new(16, "Johnny English")
    assert_equal 16, node.score
  end

  def test_it_can_have_a_title
    node = Node.new(16, "Johnny English")
    assert_equal "Johnny English", node.title
  end

  def test_it_can_have_a_different_title
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_equal "Bill & Ted's Excellent Adventure", node.title
  end

  def test_it_has_left_node_and_default_is_nil
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_nil node.left_node
  end

  def test_it_has_right_node_and_default_is_nil
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_nil node.right_node
  end

  def test_it_has_depth
    node = Node.new(61, "Bill & Ted's Excellent Adventure")
    assert_nil node.depth
  end
end
