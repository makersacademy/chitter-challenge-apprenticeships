
require 'pg' 

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:"chitter_test")
      result = connection.exec("SELECT * FROM peeps")
    else
      connection = PG.connect(dbname:"chitter")
      result = connection.exec("SELECT * FROM peeps")
    end  
    
    p result
    
    peeps_list = []
    
    result.each do |peep|
      peeps_list.push([peep["message"],peep["created_at"]])
    end
    peeps_list
  end
  
  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname:'chitter')
    end    
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}');")
  end    

end
