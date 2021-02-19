require 'pg'

class LoaderStorer

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

    connection.exec("INSERT INTO peeps (message, name, timestamp) VALUES ('#{message}', '#{name}', '#{timestamp}') RETURNING id, message, name, timestamp;")
  end
end
