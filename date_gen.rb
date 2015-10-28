

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

  # def self.produce_new(date = Time.now.strftime('%d%m%y'))
  #   date = date.to_s.delete!('/').to_i
  #
  #   product = @date ** 2
  #   date_key = product.to_s.chars[-4..-1]
  #   date_key.map do |string|
  #     string.to_i
  #   end
  # end
  #
  # def self.is_valid?(generated_date)
  #   # do a check here
  # end
end
