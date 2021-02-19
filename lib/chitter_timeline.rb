require 'pg'

class ChitterTimeline

  def self.all
    connection = self.environment
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| peep['message'] }  
  end

  def self.add(peep:)
    connection = self.environment
    connection.exec("INSERT INTO peeps (message) values ('#{peep}');")
  end

  def self.environment
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
