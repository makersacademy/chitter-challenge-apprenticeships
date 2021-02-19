require 'pg'

class ChitterTimeline

  def self.all
    connection = self.environment
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| "#{peep['date']} #{peep['message']}" }
  end

  def self.add(peep:)
    connection = self.environment
    time = Time.new.strftime('%d/%m/%Y')
    connection.exec("INSERT INTO peeps (message, date) values ('#{peep}', '#{time}');")
  end

  def self.environment
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
