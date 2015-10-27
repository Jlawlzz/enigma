gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'encryptor'


class EncryptorTest < Minitest::Test

  def test_encryptor_takes_message
    encryptor = Encryptor.new("Message")
    assert_equal "message", encryptor.message
  end

  def test_encryptor_takes_key
    encryptor = Encryptor.new("message", 10/30/92)
    assert_equal [0,4,6,4], encryptor.date
  end

end
