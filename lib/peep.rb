require 'pg'

class Peep

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    all_peeps = connection.exec("SELECT * FROM peeps")
    all_peeps.map { |peep| peep['message'] }
  end

  def self.create(new_peep)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    query = "INSERT INTO peeps (message) VALUES($1) RETURNING message;"
    connection.exec_params(query, [new_peep])
  end

end