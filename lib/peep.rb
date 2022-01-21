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
    results = connection.exec("SELECT * FROM peeps ORDER BY date DESC;")
    results.map { |peep| Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])}
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message, date) values ('#{message}', 'NOW()');")
  end
end
