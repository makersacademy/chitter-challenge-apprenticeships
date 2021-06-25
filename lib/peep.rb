class Peep
  attr_reader :username, :message

  def self.add(username:, message:)
    Peep.new(username, message)
  end

  def initialize(username, message)
    @username = username
    @message = message
  end
end
