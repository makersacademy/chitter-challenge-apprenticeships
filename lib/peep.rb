  require 'pg'

class Peep
  def self.see_peeps
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
    else 
        connection = PG.connect(dbname: 'chitter')
    end 
    
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end 
  end

  def self.create(message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  
    #connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}') RETURNING id, message, date", [message, date])
    result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}') RETURNING id, date, message;")
    Peep.new(id: result[0]['id'], date: result[0]['date'], message: result[0]['message'])
  end
  
  attr_reader :id, :title, :url

  def initialize(id:, date:, message:)
    @id  = id
    @date = date
    @message = message
  end

end
