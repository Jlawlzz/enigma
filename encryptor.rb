require_relative 'key'
require_relative 'date_gen'

class Encryptor

  attr_reader :message, :date

  def initialize(message, key = nil, date = nil)
    @message = message.downcase
    @key = Key.new
    @date = DateGen.new(date).date_key
  end

end
