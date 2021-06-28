require 'pg'

class Peeps
  def self.all
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peeps = connection.exec('SELECT * FROM peeps;')
    peeps.map { |peep| peep['message'] }
  end

  def self.create(message:)
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
  end
end