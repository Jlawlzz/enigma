require_relative 'shifter'
require_relative 'key'
require_relative 'date_gen'
require_relative 'offset_combine'
require 'pry'

class Crack

  attr_reader :message_char, :date, :key, :final_key

  def initialize(message, date = nil)
    @message = message
    @message_char = message.chars
    @date_offset = DateGen.new(date).date_key
    @final_key = final_key
    offsets_make_negative
  end

  def offsets_make_negative
    neg_date_offset = @date_offset.map do |offset|
      offset *= -1
    end
    decrypt(neg_date_offset)
    return neg_date_offset
  end

  def decrypt(neg_offset)
    dedated_array = @message_char.map.with_index do |char, index|
      Shifter.new(char, neg_offset[index % 4]).crypt_char
    end
    isolate_end_chars(dedated_array)
    return dedated_array
  end

  def isolate_end_chars(dedated_array)
    dedated_end_chars = dedated_array[-4..-1]
    index_dedated_and_target_chars(dedated_end_chars)
    return dedated_end_chars
  end

  def index_dedated_and_target_chars(dedated_end_chars)
    ideal_chars = 'nd..'.chars
    ideal_index = locate_index(ideal_chars)
    dedated_index = locate_index(dedated_end_chars)
    deduce_key_offsets(ideal_index, dedated_index)
    return ideal_index, dedated_index
  end

  def locate_index(chars)
    range = (' '..'z')
    chars.map do |char|
      range.find_index(char)
    end
  end

  def deduce_key_offsets(ideal_index, dedated_index)
    key_offsets = dedated_index.map.with_index do |offset_index, index|
      offset_index - ideal_index[index]
    end
    normalize_key_offsets(key_offsets)
    return key_offsets
  end

  def normalize_key_offsets(key_offsets)
    key_offsets = key_offsets.map do |offset|
      offset %= 91
    end
    rotate_end_chars(key_offsets)
    return key_offsets
  end

  def rotate_end_chars(key_offsets)
    rotate_remain = @message_char.length % 4
    key_offsets.rotate!(-rotate_remain)
    create_final_key(key_offsets)
    return key_offsets
  end

  def create_final_key(key_offsets)
    @final_key = key_offsets.join.to_s.squeeze.to_i
    return @final_key
  end

end

if __FILE__ == $0
  binding pry
end
