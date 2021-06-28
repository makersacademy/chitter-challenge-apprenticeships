require 'pg'

class Peep

  attr_reader :id, :message, :peep_date

  def initialize(id, message, peep_date)
    @id = id
    @message = message
    @peep_date = peep_date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
  end

  def self.add(message, peep_date)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message, peep_date) VALUES ('#{message}', '#{peep_date}')
    RETURNING id, message, peep_date")
  end

end
