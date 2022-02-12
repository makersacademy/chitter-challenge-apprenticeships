require 'pg'

class Peep 
  def self.all 
    #connect to database
    if ENV['ENVIRNOMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['message'] }
  end 

  def self.create(peep:)
    if ENV['ENVIRNOMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
  
    connection.exec("INSERT INTO peeps (message) VALUES('#{peep}')")
  end
end