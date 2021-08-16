require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_test', :user => 'ec2-user'
    else
      connection = PG.connect :dbname => 'chitter', :user => 'ec2-user'
    end
    
    result = connection.exec("SELECT * FROM peeps;")
    
    peeps = []
  
    result.each { |row| 
      peeps.push(row["message"])
    }
    return peeps
  end
  
  
  def self.add(new_peep)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test', :user => 'ec2-user'
    else
      con = PG.connect :dbname => 'chitter', :user => 'ec2-user'
    end
    
    con.exec("INSERT INTO peeps (message) VALUES ('#{new_peep}');")
  end
end
  
  