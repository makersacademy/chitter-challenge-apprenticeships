require 'pg'

class Peep

  attr_reader :id, :date, :message

  def initialize(id:, date:, message:)
    @id = id
    @date = date
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], date: peep['date'], message: peep['message'])
    end
  end

  def self.create(message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}') RETURNING id, date, message;")
    Peep.new(id: result[0]['id'], date: result[0]['date'], message: result[0]['message'])
  end
end
