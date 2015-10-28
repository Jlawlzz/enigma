gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'shifter'



class ShifterTest < Minitest::Test

  def test_converts_character_to_num
    shift = Shifter.new('a', 12)
    assert_equal 65, shift.character_num
  end

  def test_total_shift_adds_character_num_and_shift
    shift = Shifter.new('a', 12)
    assert_equal 77, shift.total_shift
  end

  def test_finds_new_value
    shift = Shifter.new('a', 12)
    assert_equal 'm', shift.new_index
  end

  def test_finds_new_value_over_array
    shift = Shifter.new('f', 41)
    assert_equal '4', shift.new_index
  end


end
