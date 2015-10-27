

class OffsetCombine

  def self.combine(key, date)
    combine_offset = key.map.with_index do |value, index|
      value += date[index]
    end
    combine_offset
  end

end
