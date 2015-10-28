gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'decryptor'


class DecryptorTest < Minitest::Test

  def test_decryptor_takes_message
    decryptor = Decryptor.new("Wl<%kn.")
    assert_equal "Wl<%kn.", decryptor.message
  end

  def test_decryptor_makes_message_array
    decryptor = Decryptor.new("Wl<%kn.")
    assert_equal ['W','l','<','%','k','n','.'], decryptor.message_char
  end
    #
  def test_decryptor_gens_key
    decryptor = Decryptor.new("Wl<%kn.", 10309)
    assert_equal [10, 3, 30, 9], decryptor.key
  end
    #
  def test_key_combine_returns_product
    decryptor = Decryptor.new("Wl<%kn.", 10309, 103092)
    assert_equal [10, 7, 36, 13], decryptor.offset_combine(decryptor.key, decryptor.date)
  end

  def test_joins_decrypted_array
    decryptor = Decryptor.new("Wl<%kn.", 10309, 103092)
    assert_equal "Message", decryptor.decrypted_message
  end

end
  #   def test_encryptor_takes_message
  #     encryptor = Encryptor.new("Message")
  #     assert_equal "Message", encryptor.message
  #   end
  #
  #   def test_encryptor_gens_key
  #     encryptor = Encryptor.new("message", 10309)
  #     assert_equal [10, 3, 30, 9], encryptor.key
  #   end
  #
  #   def test_date_created
  #     encryptor = Encryptor.new("message", 10309)
  #     date_test = Time.now.strftime('%d%m%y')
  #     product = date_test.to_i ** 2
  #     date_key_test = product.to_s.chars[-4..-1]
  #     date_key_test = date_key_test.map do |string|
  #       string.to_i
  #     end
  #     assert_equal encryptor.date, date_key_test
  #   end
  #
  #   def test_key_combine_returns_product
  #     encryptor = Encryptor.new("message", 10309, 103092)
  #     encryptor.offset_combine
  #     assert_equal [10, 7, 36, 13], encryptor.offset_combine
  #   end
  #
  #   def test_encrypts_message
  #     encryptor = Encryptor.new("Message", 10309, 103092)
  #     assert_equal ['W', 'l', '<', "\"", 'h', '0', 'o'], encryptor.execute_encrypt
  #   end
  # end
