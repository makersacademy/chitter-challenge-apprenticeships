require 'pg'

class Peep
  attr_reader :timestamp, :message
  def initialize(message:, timestamp:)
    @message = message
    @timestamp = timestamp
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY timestamp DESC;")
    result.map  do |peep| 
      Peep.new(message: peep['message'], timestamp: peep['timestamp']) end
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("INSERT INTO peeps (message, timestamp) VALUES ('#{message}', CURRENT_TIMESTAMP)RETURNING message, timestamp;")
    Peep.new(message: result[0]['message'], timestamp: result[0]['timestamp'])
  end
end