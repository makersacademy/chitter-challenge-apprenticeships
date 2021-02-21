require 'pg'

class PeepsManager
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY date_of_peep")
    result.map { |peep| "#{peep['message']} - #{peep['date_of_peep']}" }
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('#{message}', '#{Time.now}')")
  end

  def self.filter(word)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{word}%'")
    result.map { |peep| "#{peep['message']} - #{peep['date_of_peep']}" }
  end
end