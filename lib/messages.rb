require 'pg'

class Messages
  def self.all
    # conditional check for enviroment and choose appropiate database
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    # map results from database query to variable ' result' and return each in a loop
    result = connection.exec("SELECT * from peeps;")
    result.map { |peep| peep['message'] }
  
  end
end
