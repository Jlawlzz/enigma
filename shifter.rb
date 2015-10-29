

class Shifter

  attr_reader :crypt_char, :crack_char, :total_shift, :character_num

  def initialize(character, shift)
    range = (' '..'z').to_a
    @character_num = character_to_num(character, range)
    @total_shift = shift + @character_num
    new_index(@total_shift, range)
  end

  def character_to_num(character, range)
    range.find_index(character)
  end

  def new_index(total_shift, range)
    @crypt_char = range[total_shift % 91]
  end

end
