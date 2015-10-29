require_relative 'key'
require_relative 'date_gen'
require_relative 'offset_combine'
require_relative 'offset'
require_relative 'crack'
require 'pry'

class Enigma

  def encrypt(message, key, date = nil)
    key = Key.new(key).key_offsets
    date = DateGen.new(date).date_key
    offset_combine = OffsetCombine.combine(key, date)
    encrypted_message = Offset.new(message, offset_combine)
    return encrypted_message.offset
  end

  def decrypt(message, key, date = nil)
    key = Key.new(key).key_offsets
    date = DateGen.new(date).date_key
    offset_combine = OffsetCombine.combine(key, date)
    decrypted_message = Offset.new(message, offset_combine)
    return decrypted_message.offset_make_negative
  end

  def crack(date = nil, message)
    date_set = DateGen.new(date).date_key
    offset_combine = OffsetCombine.combine([0,0,0,0], date_set)
    decrypted_message = Offset.new(message, offset_combine)
    crack = Crack.new(decrypted_message.offset_make_negative)
    decrypt(message, crack.final_key, date)
  end
end
