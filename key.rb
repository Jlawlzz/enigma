

class Key

  attr_reader :key

  def initialize(key = nil)
    @key = key
    create_key
  end

  def create_key
    if @key == nil
      @key = rand(10000..99999)
    end
    key_format(@key)
  end

  def key_format(key)
    splice = key.to_s.chars
    shift_values = []
    4.times do
      shift_values << "#{splice[0]}" + "#{splice[1]}"
      splice.rotate!
    end
    shift_values = shift_values.map do |string|
      string.to_i
    end
    @key = shift_values
  end

  def key_unformat(key_array)
  end

end
