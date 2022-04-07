require 'pg'

class DatabaseConnection
  def initialize
    @connect 
  end 

  def self.setup(dbname)
    @connect = PG.connect(dbname: dbname)
  end
  
  def self.query(query, params = [])
    @connect.exec_params(query, params)
  end
end
