
require 'time'
require 'pg'

class Messages
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end


  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Messages.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end

  def self.create(message:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    time = Time.now.strftime("%H:%M %d %b %y")
    connection.exec("INSERT INTO peeps (message, time) VALUES ('#{message}', '#{time}')")
  end
end
