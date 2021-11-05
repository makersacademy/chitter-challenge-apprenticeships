require 'pg'

class Database

  def self.connect 
    return PG.connect(dbname: 'chitter_test') if ENV['RACK_ENV'] == 'test'  
    return PG.connect(dbname: 'chitter')
  end 

  def self.all
    connection = Database.connect
    result = connection.exec('SELECT * FROM peeps ORDER BY id DESC;')
  end 

  def self.all_filtered(filter:)
    connection = Database.connect
    result = connection.exec("SELECT * FROM peeps WHERE messages LIKE '%#{filter}%'")
  end 

  def self.add(message:)
    connection = Database.connect
    time = Time.now
    time = time.strftime("%d/%m/%Y")
    result = connection.exec('INSERT INTO peeps (messages, timestamp) VALUES($1,$2)',
    [message, time])
  end 

end
