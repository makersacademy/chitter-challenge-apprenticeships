class Peep 
  attr_reader :name, :message, :timestamp, :id
  def initialize(name:, message:, timestamp:, id: nil)
    @id = id
    @name = name
    @message = message
    @timestamp = timestamp
  end

  def keywords 
    @message.split(" ").select { |word| word.include?("#") }
  end
end
