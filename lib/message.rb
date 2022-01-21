require 'pg'

class Message

  attr_reader :message, :time

  def initialize(message, time)
    @message = message
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params('SELECT * FROM peeps ORDER BY entrytime DESC;')
    result.map do |peep|
      Message.new(peep['message'],peep['entrytime'])
    end 
  end

  def self.create(new_message)      
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    if new_message.length >= 1
      connection.exec_params("INSERT INTO peeps (message) VALUES($1);", [new_message])
    end
  end

  def self.find(keyword)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%' ORDER BY entrytime DESC;")
    result.map do |peep|
      Message.new(peep['message'],peep['entrytime'])
    end 
  end
end