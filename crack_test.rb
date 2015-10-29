gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'crack'

class CrackTest < Minitest::Test

  def test_isolate_last_four_of_decrypt
    crack = Crack.new("v0+[?", 010100)
    assert_equal ["*", "+", "[", ":"], crack.isolate_end_chars(["q", "*", "+", "[", ":"])
  end

  def test_indexes_target_chars
    crack = Crack.new("v0+[?", 010100)
    assert_equal [[78, 68, 14, 14],[10, 11, 59, 26]], crack.index_dedated_and_target_chars(["*", "+", "[", ":"])
  end

  def test_deduces_key_offsets
    crack = Crack.new("v0+[?", 010100)
    assert_equal [-68, -57, 45, 12], crack.deduce_key_offsets([78, 68, 14, 14],[10, 11, 59, 26])
  end

  def test_normalize_offsets
    crack = Crack.new("v0+[?", 010100)
    assert_equal [23, 34, 45, 12], crack.normalize_key_offsets([-68, -57, 45, 12])
  end

  def test_key_rotated_correctly
    crack = Crack.new("v0+[?", 010100)
    assert_equal [12, 23, 34, 45], crack.rotate_end_chars([23, 34, 45, 12])
  end

  def test_crack_returns_key
    crack = Crack.new("v0+[?", 010100)
    assert_equal 12345, crack.create_final_key([12, 23, 34, 45])
  end

end
