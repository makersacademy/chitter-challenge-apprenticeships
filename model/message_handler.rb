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
    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
    result.map { |message_entry| Message_handler.new( id: message_entry['id'], message: message_entry['messages'], timestamp: message_entry['timestamp']) }
  end 

  def self.all_filtered(filter:)
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM peeps WHERE messages LIKE '%#{filter}%'")
    result.map { |message_entry| Message_handler.new( id: message_entry['id'], message: message_entry['messages'], timestamp: message_entry['timestamp']) }
  end 

    def self.add(message:)
    time = Time.now
    time = time.strftime("%d/%m/%Y")
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec('INSERT INTO peeps (messages, timestamp) VALUES($1,$2)',[message, time])
  end 

end