require 'pg'

class DatabaseConnection

  def self.fetch
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map do |peep|
      Peep.new(message: peep['message'], name: peep['name'], timestamp: peep['timestamp'])
    end
  end

  def self.create(message:, name:, timestamp:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message, name, timestamp) VALUES ('#{message}', '#{name}', '#{timestamp}') RETURNING id, message, name, timestamp;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], name: result[0]['name'], timestamp: result[0]['timestamp'])
  end
end
