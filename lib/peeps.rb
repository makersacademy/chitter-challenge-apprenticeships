require 'pg'

class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec 'SELECT * FROM peeps;'
    peeps.map {|peep| peep['message'] }
  end

  def self.create(peep)
    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec_params("INSERT INTO peeps (message) VALUES ($1);", [peep])
  end
end