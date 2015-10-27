gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'date_gen'

class DateGenTest < Minitest::Test

  def test_date_takes_input
    date = DateGen.produce_new(010100)
    assert_equal 010100, date.date
  end

  def test_date_takes_input
    date = DateGen.new(010100)
    assert_equal 010100, date.date
  end

  def test_gives_date_no_input
    date = DateGen.new
    assert_equal Time.now.strftime("%d%m%y").to_i, date.date
  end

  def test_gets_key_from_date
    date = DateGen.new(010100)
    assert_equal [5,6,0,0], date.get_key_from_date
  end

  def test_gets_key_current_date
    date = DateGen.new
    date_test = Time.now.strftime('%d%m%y')
    product = date_test.to_i ** 2
    date_key = product.to_s.chars[-4..-1]
    date_key = date_key.map do |string|
      string.to_i
    end
    assert_equal date_key, date.get_key_from_date
  end

end
