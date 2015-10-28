

class Shifter

  attr_reader :character_num, :total_shift, :crypt_char

  def initialize(character, shift)
    @range = (' '..'z').to_a
    @character_num = character_to_num(character)
    @total_shift = shift + @character_num
    new_index
  end

  def character_to_num(character)
    @range.find_index(character)
  end

  def new_index
    @crypt_char = @range[@total_shift % 91]
  end

end
