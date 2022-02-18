require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end  
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }

    @peeps = [
      "This is my first peep",
      "This is my second peep",
      "This is my third peep",
      "peep"
    ]
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    connection.exec("INSERT INTO peeps (message) values('#{message}');")
  end
end
