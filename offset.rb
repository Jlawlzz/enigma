require_relative 'enigma'
require_relative 'shifter'

class Offset

  attr_reader :offset_message

  def initialize(message, offset)
    @message = message
    @offset = offset
  end

  def offset_make_negative
    neg_offset = @offset.map do |number|
      number *= -1
    end
    @offset = neg_offset
    offset
  end

  def offset
    offset_array = @message.chars.map.with_index do |char, index|
      Shifter.new(char, @offset[index % 4]).crypt_char
    end
    @offset_message = offset_array.join
  end

end
