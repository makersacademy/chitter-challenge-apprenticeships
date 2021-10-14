require 'date'

class Peep
  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end
  
  def self.all
    response = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date DESC, id;")
    response.map { | response | Peep.new(id: response['id'], message: response['message'], date: response['date']) }
  end

  def self.create(message, date=nil)
    if date.nil?
      response = DatabaseConnection.query("INSERT INTO peeps(message) VALUES($1) RETURNING id, message, date", [message])
    else
      response = DatabaseConnection.query("INSERT INTO peeps(message, date) VALUES($1, $2) RETURNING id, message, date", [message, date])
    end
    Peep.new(id: response.first['id'], message: response.first['message'], date: response.first['date'])
  end

  # Keeping the date in SQL format when creating object
  # Using this method to format on the main page
  # Can maybe make this private/differnt class and instantiate with formatted date?
  def self.format_date(date)
    date = Date.strptime(date, '%Y-%m-%d')
    date.strftime('%d/%m/%y')
  end

  attr_reader :id, :message, :date
end
