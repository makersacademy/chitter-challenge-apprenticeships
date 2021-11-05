require 'pg'
require_relative 'database_handler'
class Message_handler
  attr_reader :id, :message, :timestamp
  def initialize(id:, message:, timestamp: )
    @id = id 
    @message = message
    @timestamp = timestamp
  end

  def self.all(db = Database)
    result = db.all
    result.map { |message_entry| Message_handler.new( id: message_entry['id'], message: message_entry['messages'], timestamp: message_entry['timestamp']) }
  end 

  def self.all_filtered(db = Database, filter:)
    result = db.all_filtered(filter: filter)
    result.map { |message_entry| Message_handler.new( id: message_entry['id'], message: message_entry['messages'], timestamp: message_entry['timestamp']) }
  end 

  def self.add(db = Database, message:)
    db.add(message: message)
  end 
end
