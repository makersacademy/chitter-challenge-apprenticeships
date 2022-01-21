require 'pg'

class Peep

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  attr_reader :id, :message

  def date
    timestamp = Time.at(@date.to_i)
    return_this = timestamp.strftime("%d/%m/%Y at %k:%M")
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY date DESC;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end   
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # timestamp = Time.to_i
    peep = connection.exec_params("INSERT INTO peeps (message, date) 
      VALUES($1, $2) RETURNING id, message", [message, Time.now.to_i])
  end

end
