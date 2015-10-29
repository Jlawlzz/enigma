gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'offset_combine'

class OffsetCombineTest < Minitest::Test

  def test_key_combine_returns_product
    assert [10, 7, 36, 13], OffsetCombine.combine([10,3,30,9],[0,4,6,4])
  end

end
