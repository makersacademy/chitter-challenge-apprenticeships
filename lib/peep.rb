require_relative 'database_connection'

class Peep
  attr_reader :id, :message, :date_posted

  def initialize(id:, message:, date_posted:)
    @id = id
    @message = message
    @date_posted = date_posted
  end

  def self.create(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, date_posted) VALUES($1, $2) RETURNING id, message;", [message, Date.today])
    Peep.new(
      id: result[0]['id'],
      message: result[0]['message'],
      date_posted: result[0]['date_posted']
    )
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(
        id: peep['id'],
        message: peep['message'],
        date_posted: peep['date_posted']  
      )
    end
  end
end
