class Message
  def initialize
    @messages = []
  end

  def add(message)
    @messages << message
  end

  def all
    return @messages
  end
end
