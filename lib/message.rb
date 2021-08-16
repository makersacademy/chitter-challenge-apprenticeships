require 'pg'

class Message

  def initialize(id: , message: , time:)
    @message = message
    @time = time
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |message| message['message'] }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
   
    date = Time.now
    connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}')")
  end

end