

class Shifter

  attr_reader :character_num, :total_shift

  def initialize(character, shift)
    @range = ('a'..'z').to_a + ('0'..'9').to_a + [' ', ',', '.']
    @character_num = character_to_num(character)
    @total_shift = shift + @character_num
    new_index
  end

  def character_to_num(character)
    @range.find_index(character)
  end

  def new_index
    @range[@total_shift % 39]
  end

end
