require 'Minitest'
require 'Minitest/Autorun'
require 'Minitest/Pride'
require_relative 'offset_combine'

class OffsetCombineTest < Minitest::Test

  def test_key_combine_returns_product
    combine = OffsetCombine.combine([10,3,30,9],[0,4,6,4])
    assert [10, 7, 36, 13]
  end

end
