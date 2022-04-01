require 'pg'
require_relative 'peep'

class PeepViewer
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")

    result.map { |peep|
      Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
    }
  end

  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    todays_date = Date.today.to_s

    result = connection.exec_params("INSERT INTO peeps (message, date) VALUES ($1, $2) RETURNING id, message, date;", [message, todays_date])

    Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end
end