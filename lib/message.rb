require_relative 'database_connection'

class Message

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    # connection = if ENV['ENVIRONMENT'] == 'test'
    #   PG.connect(dbname: 'chitter_test')
    # else
    #   PG.connect(dbname: 'chitter')
    # end

      result = DatabaseConnection.query("SELECT * FROM peeps;")
      result.map { |entry| 
        Message.new(id: entry['id'], message: entry['message'], time: entry['time']) 
      }
  end

  def self.peep(message:) #time date would need to go here
    fail 'data type is not a string' unless message.is_a?(String)

    # connection = ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
    time = Message.date
    result = DatabaseConnection.query("INSERT INTO peeps (message, time) VALUES('#{message}', '#{time}') RETURNING id, message;")
    
    Message.new(id: result.first['id'], message: result.first['message'], time: result.first['time'])
  end

  def self.date
    time = Time.new
    dmy = time.strftime("%d/%m/%Y")
    clock = time.strftime("%k:%M")

    result = "#{clock} #{dmy}"
  end

end
