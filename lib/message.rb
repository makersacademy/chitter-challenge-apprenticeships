require 'pg'

class Message 
  def self.all 
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |messages| messages['message']}
  end
end
