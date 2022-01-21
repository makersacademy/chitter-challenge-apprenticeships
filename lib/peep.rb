require 'pg'

class Peep

  attr_reader :peep, :message, :date

  def initialize(peep:, message:, date:)
    @peep = peep
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }
  end

  def self.create(message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message, date) 
    VALUES('#{message}', '#{date}') RETURNING message, date")
  end
end
