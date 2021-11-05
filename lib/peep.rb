require 'pg'

class Peep

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.all 
    connection = Peep.connect
    all_peeps = connection.exec("SELECT * FROM peeps")
    all_peeps.map { |peep| peep['message'] }
  end

  def self.create(new_peep)
    connection = Peep.connect
    query = "INSERT INTO peeps (message) VALUES($1) RETURNING message;"
    connection.exec_params(query, [new_peep])
  end

end