require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :timestamp, :message
  def initialize(message:, timestamp:)
    @message = message
    @timestamp = timestamp
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps 
    ORDER BY timestamp DESC;")
    result.map do |peep| 
      Peep.new(message: peep['message'], timestamp: peep['timestamp']) 
    end
  end

  def self.post(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message, timestamp) 
      VALUES ('#{message}', CURRENT_TIMESTAMP)RETURNING message, timestamp;")
    Peep.new(message: result[0]['message'], timestamp: result[0]['timestamp'])
  end

  def self.filter(filter:)

    result = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{filter}%' ORDER BY timestamp DESC;")
    @filtered_messages = result.map do |peep| 
      Peep.new(message: peep['message'], timestamp: peep['timestamp']) 
    end
  end

  def self.filtered_messages
    @filtered_messages
  end
end
