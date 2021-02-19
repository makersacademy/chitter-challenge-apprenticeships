class Peep 
  attr_reader :name, :message, :timestamp
  def initialize(name:, message:, timestamp:)
    @name = name
    @message = message
    @timestamp = timestamp
  end

  def keywords 
    @message.split(" ").select{ |word| word.include?("#")}.join(" ")
  end
end