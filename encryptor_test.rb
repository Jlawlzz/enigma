gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'encryptor'


class EncryptorTest < Minitest::Test

  def test_encryptor_takes_message
    encryptor = Encryptor.new("Message")
    assert_equal "message", encryptor.message
  end

  def test_encryptor_gens_key
    encryptor = Encryptor.new("message", 10309)
    assert_equal [10, 3, 30, 9], encryptor.key
  end

  def test_date_created
    encryptor = Encryptor.new("message", 10309)
    date_test = Time.now.strftime('%d%m%y')
    product = date_test.to_i ** 2
    date_key_test = product.to_s.chars[-4..-1]
    date_key_test = date_key_test.map do |string|
      string.to_i
    end
    assert_equal encryptor.date, date_key_test
  end
end
