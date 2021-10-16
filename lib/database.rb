require 'pg'
class Database
  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    return connection
  end

  def self.get_messages
    connection = Database.connect
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |message| message['message'] }
  end

  def self.add_message(text:)
    connection = Database.connect
    connection.exec("INSERT INTO peeps (message) VALUES('#{text}')")
  end
end
