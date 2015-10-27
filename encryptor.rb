require_relative 'key'
require_relative 'date_gen'

class Encryptor

  attr_reader :message, :date, :key

  def initialize(message, key = nil)
    @message = message.downcase
    @key = Key.new(key).key
    @date = DateGen.new.date_key
  end

end
