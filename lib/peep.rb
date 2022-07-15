require 'pg'

class Peep

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps ORDER BY date DESC')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.add(message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec_params(
      "INSERT INTO peeps (message, date) VALUES($1, $2) RETURNING id, message, date;",
      [message, date]
      ).first
    Peep.new(id: result['id'], message: result['message'], date: result['date'])
  end
end
