require 'pg'

class PeepMessages
  attr_reader :message
  
  def initialize(message = '')
    @message = message
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    p result = connection.exec("SELECT * FROM peeps")
    result.map { | message | message['message'] }
  end 

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end

end 