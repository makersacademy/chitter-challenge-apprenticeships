require 'pg' 

class Peep
 
  @@connection = nil

  def self.connect(dbname)
    @@connection = PG.connect(dbname: dbname)
  end
  
  def self.list_peeps
    result = @@connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['message'] }
  end
end
