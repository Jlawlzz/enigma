require_relative 'key'
require_relative 'date_gen'
require_relative 'offset_combine'
require_relative 'offset'

class Enigma

  def encrypt(message, key, date)
    key = Key.new(key).key
    date_key = DateGen.new(date).date_key
    offset_combine = OffsetCombine.combine(key, date_key)
    encrypted_message = Offset.new(message, offset_combine)
    return encrypted_message.offset
  end

  def decrypt(message, key, date)
    key = Key.new(key).key
    date_key = DateGen.new(date).date_key
    offset_combine = OffsetCombine.combine(key, date_key)
    decrypted_message = Offset.new(message, offset_combine)
    return decrypted_message.offset_make_negative
  end

end
