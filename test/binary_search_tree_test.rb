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

  def test_it_has_a_root
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
    assert_equal 16, tree.root.left.score
    assert_equal "Johnny English", tree.root.left.title
    assert_equal 1, tree.root.left.depth
  end

  def test_it_can_insert_to_the_right
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(92, "Sharknado 3")
    assert_equal 92, tree.root.right.score
    assert_equal "Sharknado 3", tree.root.right.title
    assert_equal 1, tree.root.right.depth
  end

  def test_it_can_insert_again_at_a_deeper_level
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 50, tree.root.left.right.score
    assert_equal "Hannibal Buress: Animal Furnace", tree.root.left.right.title
    assert_equal 2, tree.root.left.right.depth
  end

  def test_it_can_see_if_included
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert tree.include?(16)
  end

  def test_it_can_tell_if_not_included
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    refute tree.include?(72)
  end

  def test_it_can_find_scoes_depth
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 0, tree.depth_of(61)
  end

  def test_it_can_find_other_depths
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    assert_equal 1, tree.depth_of(16)
    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
  end

  def test_it_can_tell_max_score
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    data = {"Sharknado 3"=>92}
    assert_equal data, tree.max
  end

  def test_it_can_tell_a_different_max_score
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(99, "Hannibal Buress: Animal Furnace")
    data = {"Hannibal Buress: Animal Furnace"=>99}
    assert_equal data, tree.max
  end

  def test_it_can_find_min_score
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    data = {"Johnny English"=>16}
    assert_equal data, tree.min
  end

  def test_it_can_find_different_min_score
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    tree.insert(2, "Behind Enemy Lines")
    data = {"Behind Enemy Lines"=>2}
    assert_equal data, tree.min
  end

  def test_it_can_sort
    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")
    sorted = [{"Johnny English"=>16}, {"Hannibal Buress: Animal Furnace"=>50},
    {"Bill & Ted's Excellent Adventure"=>61}, {"Sharknado 3"=>92}]
    assert_equal sorted, tree.sort
  end

  def test_it_can_load_a_file
    tree.load("./movies.txt")
    assert File.exists?("./movies.txt")
    assert_equal 99, tree.load("./movies.txt")
  end

  def test_it_can_determine_health
    skip
    tree.insert(98, "Animals United")
    tree.insert(58, "Armageddon")
    tree.insert(36, "Bill & Ted's Bogus Journey")
    tree.insert(93, "Bill & Ted's Excellent Adventure")
    tree.insert(86, "Charlie's Angels")
    tree.insert(38, "Charlie's Country")
    tree.insert(69, "Collateral Damage")
    assert_equal [[98, 7, 100]], tree.health(0)
  end


end
