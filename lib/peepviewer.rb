require 'pg'

class PeepViewer
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    p result
    result.map { |peep|
      peep['date']
    }
  end

  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    todays_date = Date.today
    result = connection.exec_params("INSERT INTO peeps (message, date) VALUES ($1, $2);", [message, todays_date])
  end
end