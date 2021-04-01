require 'pg'

class Peep
  attr_reader :message, :date

  def initialize(message:, date: )
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
    result.map do |peep|
      Peep.new(message: peep['message'], date: peep['date'])
    end

  end

  def self.create(message: , date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}') RETURNING message, date;")
    Peep.new(message:result[0]['message'], date:result[0]['date'])
  end

end
