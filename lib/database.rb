require 'pg'
require 'date'
require 'time'
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
    result = connection.exec("SELECT * FROM peeps ORDER BY date, time;")
    result
  end

  def self.add_message(text:)
    connection = Database.connect
    connection.exec("INSERT INTO peeps (message, date, time) VALUES('#{text}','#{Date.today}','#{Time.now}')")
  end
end
