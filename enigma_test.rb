gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'enigma'

class EnigmaTest < Minitest::Test

  def test_if_enigma_encrypts
    enigma = Enigma.new
    assert_equal "^':Er),M?K,@uKP", enigma.encrypt('Message ..end..', 12345, 010100)
  end

  def test_if_enigma_decrypts
    enigma = Enigma.new
    assert_equal "Message ..end..", enigma.decrypt("^':Er),M?K,@uKP", 12345, 010100)
  end

  def test_if_enigma_cracks
    enigma = Enigma.new
    assert_equal "Message ..end..", enigma.crack("^':Er),M?K,@uKP", 010100)
  end

end
