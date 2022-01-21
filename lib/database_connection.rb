require 'pg'
require 'message'

class DatabaseConnection

  def self.setup
   @connection = 
    if ENV['ENVIRONMENT'] == 'test'
     PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end 
  end 

  def self.query(sql)
    @connection.exec(sql)
  end 

end 


