require 'pg'

class Message
  def self.all
    if ENV['ENIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |message| message['message']}
  end
end
