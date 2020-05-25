require 'pg'

class Message
  attr_reader :id, :date, :message
  def initialize(id:, date:, message:)
    @id = id
    @date = date
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |message|
      Message.new(id: message['id'], date: message['date'], message: message['message'])
      #Creates new array of hashes?? With id, date and message key-value pairs
    end
  end

  def self.add(message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}') RETURNING id, message, date")
      Message.new(id: result[0]['id'], date: result[0]['date'], message: result[0]['message'])
      # Inserts whatever message and date values are entered by user in the form and returns them to result variable
      # Which avoids need for .all method to be called
      # Creates new message object and initializes values 
  end
end
