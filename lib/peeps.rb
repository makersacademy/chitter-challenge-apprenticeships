require 'pg'
class Peeps


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
 result.map do |peeps|
end


end


end
