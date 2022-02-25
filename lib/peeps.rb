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

    result = connection.exec('SELECT * FROM peeps ORDER BY date DESC;')
    result.map do |peep| Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    end
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params("INSERT INTO peeps (message, date) VALUES($1, '#{Time.new}') RETURNING id, message;", [message])
    Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end

end