gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'key'

class KeyTest < Minitest::Test

  def test_creates_random_key_5_digits
    skip
    assert_equal 5, key.key.to_s.length
  end

  def test_key_formats_to_array
    key = Key.new
    assert_equal [10, 3, 30, 9], key.key_format(10309)
  end

end
