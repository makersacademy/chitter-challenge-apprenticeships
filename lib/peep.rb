require 'pg'

class Peep

  attr_reader :message, :peep_date

  def initialize(message, peep_date)
    @message = message
    @peep_date = peep_date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("SELECT * FROM peeps")
  end

  def self.add(message, peep_date)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message, peep_date) VALUES ('#{message}', '#{peep_date}')")
  end

end
