require 'pg'

class Peeps

  def self.all_peeps
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end 
    
    p all_entries = con.exec('SELECT * FROM peeps;')
    p all_entries.map { |peep| peep ['message'] } #[peep_date] is breaking 
  end 

  def self.new_peep(peep_text:)
    if ENV['ENVIRONMENT'] == 'test' #Look into how to DRY this out
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("INSERT INTO peeps (message) VALUES('#{peep_text}')") #Value or valueS ?    

  end 
end 