require 'date'

class Peep
  attr_reader :id, :message, :time_stamp

  def initialize(message, time_stamp = DateTime.now, id = rand(1...1000))
    @id = id
    @message = message
    @time_stamp = time_stamp
  end


  def ==(other)
    if other.class == self.class
      return id == other.id
    end
      false
  end
end