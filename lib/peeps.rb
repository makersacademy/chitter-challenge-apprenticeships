require 'pg'

class Peeps
  attr_reader :peep

def self.all
if ENV['ENVIROMENT'] == 'test'
  connection = PG.connect(dbname: 'chitter_test')
  #this determines which database to connect to
else
  connection = PG.connect(dbname: 'chitter')
end

 result = connection.exec("SELECT * FROM peeps")
 #once you are in chitter return all peeps stored in table
 #this is exactly how you input when using the database
 result.map{ |peep| peep['message'] }
 #u need to call the value of the hash! hence [message]
end
def self.create(message:)
  if ENV['ENVIROMENT'] == 'test'
    connecttion = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}')")
  #connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
 end
end
