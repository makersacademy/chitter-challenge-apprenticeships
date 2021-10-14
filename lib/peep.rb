class Peep
  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end
  
  def self.all
    response = DatabaseConnection.query("SELECT * FROM peeps;")
    response.map { | response | Peep.new(id: response['id'], message: response['message'], date: response['date']) }
  end

  attr_reader :id, :message, :date
end