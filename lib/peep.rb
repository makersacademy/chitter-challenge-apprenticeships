require 'date'

class Peep
  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end
  
  def self.all
    response = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date DESC, id DESC;")
    response.map do
      |response| Peep.new(id: response['id'], message: response['message'], date: response['date'])
    end
  end

  def self.create(message, date = nil)
    if date.nil?
      response = DatabaseConnection.query(
        "INSERT INTO peeps(message) VALUES($1) RETURNING id, message, date", [message])
    else
      response = DatabaseConnection.query(
        "INSERT INTO peeps(message, date) VALUES($1, $2) RETURNING id, message, date",
        [message, date])
    end
    Peep.new(id: response.first['id'], message: response.first['message'],
      date: response.first['date'])
  end

  def self.filter(message)
    # upcase to match message case-insensitive
    formatted_message = "%#{message.upcase}%"
    response = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE UPPER(message) LIKE $1;", [formatted_message])
    response.map do
      |response| Peep.new(id: response['id'], message: response['message'], date: response['date'])
    end
  end

  attr_reader :id, :message, :date
end
