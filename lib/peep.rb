require 'pg'

class Peep
  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |message| message['message'] }
  end

  def self.create(peep:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'chitter_test')
                 else
                   PG.connect(dbname: 'chitter')
                 end
    connection.exec("INSERT INTO peeps (message) VALUES('#{peep}')")
  end
end
