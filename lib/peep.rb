require 'date'
require_relative 'peep_factory'

class Peep
  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end
  
  def self.all
    response = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date DESC, id DESC;")
    response.map do
      |peep| PeepFactory.wrap_peep_response_in_object(peep)
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
    PeepFactory.wrap_peep_response_in_object(response.first)
  end

  def self.filter(message)
    # upcase to match message case-insensitive
    formatted_message = "%#{message.upcase}%"
    response = DatabaseConnection.query(
      "SELECT * FROM peeps WHERE UPPER(message) LIKE $1
      ORDER BY date DESC, id DESC;", [formatted_message])
    response.map { |peep| PeepFactory.wrap_peep_response_in_object(peep) }
  end

  attr_reader :id, :message, :date
end
