require_relative 'key'
require_relative 'date_gen'
require_relative 'offset_combine'
require_relative 'shifter'
require 'pry'

class Encryptor

  attr_reader :message, :message_char, :date, :key, :encrypted_message

  def initialize(message, key = nil, date = nil)
    @message = message
    @message_char = message.chars
    @key = Key.new(key).key
    @date = DateGen.new(date).date_key
    offset_combine(@key, @date)
  end

  def offset_combine(key, date)
    offset = OffsetCombine.combine(key, date)
    encrypt(offset)
    return offset
  end

  def encrypt(offset)
    encrypted_array = message_char.map.with_index do |char, index|
      Shifter.new(char, offset[index % 4]).crypt_char
    end
    @encrypted_message = encrypted_array.join
  end

end

if __FILE__ == $0
  binding pry
end
