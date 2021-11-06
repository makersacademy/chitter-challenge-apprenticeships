require 'date'

class Peep
  attr_reader :message, :date

  def initialize(message = "", date = "")
    @message = message
    @date = date.empty? ? DateTime.now.day : date
  end
end
