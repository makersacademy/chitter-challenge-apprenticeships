require 'pg'

class Peeps

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end 
    
    all_entries = con.exec('SELECT * FROM peeps;')
    all_entries.map { |peep| peep ['message'] } 
    
  end 

end 