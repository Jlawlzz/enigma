require_relative 'key'
require_relative 'date_gen'
require_relative 'offset_combine'
require_relative 'shifter'

class Decryptor

  attr_reader :message, :message_char, :date, :key, :decrypted_message

  def initialize(message, key = nil, date = nil)
    @message = message
    @message_char = message.chars
    @key = Key.new(key).key
    @date = DateGen.new(date).date_key
    offset_combine(@key, @date)
  end

  def offset_combine(key, date)
    offset = OffsetCombine.combine(key, date)
    offset_make_negative(offset)
    return offset
  end

  def offset_make_negative(offset)
    neg_offset = offset.map do |number|
      number *= -1
    end
    decrypt(neg_offset)
  end

  def decrypt(neg_offset)
    decrypted_array = @message_char.map.with_index do |char, index|
      Shifter.new(char, neg_offset[index % 4]).crypt_char
    end
    @decrypted_message = decrypted_array.join
  end

end
