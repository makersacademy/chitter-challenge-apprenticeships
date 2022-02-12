require 'pg'
require 'date'

class Peep 
  def self.all 
    #connect to database
    if ENV['ENVIRNOMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end

    result = connection.exec('SELECT * FROM peeps ORDER BY created_at DESC;')
    result.flat_map { |peep| [peep['message'] + ' - ' + Date.parse(peep['created_at']).to_s] }
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