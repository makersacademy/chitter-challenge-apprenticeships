class Peep
  
  def initialize(message)
    @message = message
  end

  def self.all
    [
      "Hello, this is a new peep!", 
      "What peep shall I write today?",
      "My favourite food is pizza"
    ]
  end

end