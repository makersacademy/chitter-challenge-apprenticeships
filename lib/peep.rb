require 'date'

class Peep
  attr_reader :message, :date

  def initialize(message = "", date = "")
    @message = message
    @date = date == "" ? Date.today.strftime("%m/%d/%Y") : date
  end
end
