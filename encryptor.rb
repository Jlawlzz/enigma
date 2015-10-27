require_relative 'key'
require_relative 'date_gen'
require_relative 'offset_combine'
require_relative 'shifter'

class Encryptor

  attr_reader :message, :date, :key, :offset

  def initialize(message, key = nil, date = nil)
    @message = message
    @key = Key.new(key).key
    @date = DateGen.new(date).date_key
  end

  def offset_combine
    @offset = OffsetCombine.combine(@key, @date)
  end

  def message_to_array
    @message = @message.chars
  end

  def encrypt
    counter = 0
    encrypted_message = []
    @message.each do |char|
      encrypted_message << Shifter.new(char, @offset[counter]).new_index
      counter += 1
      if counter == 3
        counter = 0
      end
    end
    encrypted_message
  end



end
