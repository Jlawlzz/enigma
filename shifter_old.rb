


class Shifter

  attr_accessor :letter, :letter_num, :shift

  def initialize(letter, shift)
    @range = ('a'..'z').to_a + ('0'..'9').to_a + [' ', ',', '.']
    @letter = letter
    @letter_num = letter_to_num(letter)
    shift_adjustment(shift)
  end

  def shift_adjustment(shift)
    if shift >= 39
      @shift = shift % 39
    else
      @shift
    end
  end

  def letter_to_num(letter)
    @range.find_index(letter)
  end

  def make_shift(num_letter, shift)
    index = 0
    if shift + letter <= 38
      index = @range.index(shift + letter)
    else
      index = @range.index(shift + letter % 39)
    end
    output = @range[index]
  end

end
