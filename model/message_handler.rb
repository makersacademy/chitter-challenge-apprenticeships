require 'pg'
class Message_handler
  attr_reader :id, :message, :timestamp
  def initialize(id:, message:, timestamp: )
    @id = id 
    @message = message
    @timestamp = timestamp
  end

  def self.all 
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec('SELECT * FROM peeps ;')
    result.map { |message_entry| Message_handler.new( id: message_entry['id'], message: message_entry['messages'], timestamp: message_entry['timestamp']) }
  end 

end