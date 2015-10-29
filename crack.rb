require_relative 'shifter'
require_relative 'offset_combine'
require 'pry'

class Crack

  attr_reader :message_char, :final_key

  def initialize(message)
    @message_char = message.chars
    @final_key = final_key
    isolate_end_chars(@message_char)
  end

  def isolate_end_chars(message_char)
    dedated_end_chars = message_char[-4..-1]
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

#can i make negative to force correct answer?
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
    fill_in_zeroes(key_offsets)
    return key_offsets
  end

  def fill_in_zeroes(key_offsets)
    key_offsets.map! do |offset|
      if offset < 10
        offset = '0' + offset.to_s
        offset.to_i
      else
        offset
      end
    end
    create_final_key(key_offsets)
  end

  def create_final_key(key_offsets)
    @final_key = key_offsets.join.to_s.squeeze.to_i
    return @final_key
  end

end

if __FILE__ == $0
  binding pry
end
