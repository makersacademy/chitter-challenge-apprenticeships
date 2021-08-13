
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
    
    peeps_list = []
    
    result.each do |peep|
      peeps_list.push(peep["message"])
    end
    peeps_list
  end  

end
