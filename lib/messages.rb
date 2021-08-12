require 'pg'

class Messages

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end 

    results = connection.exec("SELECT * FROM peeps;")
    results.map { |messages| messages['message'] }
 
  end  

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (message) VALUES ('#{message}')")
  end 
end