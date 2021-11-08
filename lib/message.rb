require 'pg'

class Message
  def self.all
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec('SELECT * FROM peeps_test')
      result.map { |peeps| peeps['message'] }
    else
      connection = PG.connect(dbname: 'chitter')
      result = connection.exec('SELECT * FROM peeps')
      result.map { |peeps| peeps['message'] }
    end
  end 

  def self.create(new_post:)
    if ENV['Environment'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps_test (message) VALUES('{#new_post}');")
    else
      connection = PG.connect(dbname: 'chitter')
      connection.exec("INSERT INTO peeps (message) VALUES('{#new_post}');")
    end 
  end

end 