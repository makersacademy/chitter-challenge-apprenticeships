require 'pg'
require 'date'
require_relative 'database_connection'

class Peeps
  attr_reader :id, :message, :date
  TODAY = Time.new.day.to_s + "-" + Time.new.month.to_s + "-" + Time.new.year.to_s

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY date DESC, id DESC;")
    result.map do |peep|
      Peeps.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.post(cheep:)
    return false unless self.message_length(message: cheep)
    
    result = DatabaseConnection.query("INSERT INTO peeps (message, date) VALUES ('#{cheep}', '#{TODAY}') RETURNING id, message, date")
    Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

  private
  def self.message_length(message:)
    message.length < 60
  end

end
