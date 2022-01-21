require 'pg'

class Peep
  attr_reader :id, :message, :created_at

  def initialize(id, message, created_at)
    @id = id
    @message = message
    @created_at = created_at
  end

  def self.all(order="ASC")
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    results = connection.exec("SELECT * FROM peeps ORDER BY created_at #{order};")

    results.map { |peep| Peep.new(peep['id'], peep['message'], peep['created_at']) }
  end

  def self.create(message)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message, created_at) VALUES ('#{message}', '#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}') RETURNING *;")

    Peep.new(result[0]['id'], result[0]['message'], result[0]['created_at'])
  end
end