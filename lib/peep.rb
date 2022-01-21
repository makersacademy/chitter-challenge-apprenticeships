require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id, message)
    @id = id
    @message = message
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    results = connection.exec('SELECT * FROM peeps;')

    results.map { |peep| Peep.new(peep['id'], peep['message']) }
  end

  def self.create(message)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING *;")

    Peep.new(result[0]['id'], result[0]['message'])
  end
end