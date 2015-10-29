require 'pry'

class Key

  attr_reader :key_offsets

  def initialize(key = nil)
    @key = key
    create_key
  end

  def create_key
    if @key == nil
      @key = rand(10000..99999)
    end
    make_key_array(@key)
    @key
  end

  def make_key_array(key)
    splice = key.to_s.chars
    shift_values = []
    4.times do
      shift_values << "#{splice[0]}" + "#{splice[1]}"
      splice.rotate!
    end
    make_key_final(shift_values)
  end

  def make_key_final(shift_values)
    shift_values = shift_values.map do |string|
      string.to_i
    end
    @key_offsets = shift_values
  end
end
