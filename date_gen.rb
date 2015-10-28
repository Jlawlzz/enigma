

class DateGen

  attr_reader :date, :date_key

  def initialize(date = nil)
    @date = date
    set_date
  end

  def set_date
    if @date == nil
      @date = Time.now.strftime('%d%m%y').to_i
    end
    get_key_from_date
  end

  def get_key_from_date
    product = @date ** 2
    date_key = product.to_s.chars[-4..-1]
    date_key = date_key.map do |string|
      string.to_i
    end
    @date_key = date_key
  end

end
