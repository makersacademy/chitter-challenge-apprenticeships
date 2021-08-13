
require 'pg' 

class Peep

  def self.all
    connection = PG.connect(dbname:"chitter")
    result = connection.exec("SELECT * FROM peeps")
    peeps_list = []
    
    result.each do |peep|
      peeps_list.push(peep["message"])
    end
    peeps_list
  end  

end
