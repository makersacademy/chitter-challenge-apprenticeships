require 'date'
class Peep
  attr_reader :id, :message, :created_at

  def initialize(id:, message:, created_at:)
    @id = id
    @message = message
    @created_at = created_at
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

   result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC;")
   result.map { |peep| Peep.new(id: peep['id'], message: peep['message'], created_at: DateTime.parse(peep['created_at'])) }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, created_at")
    Peep.new(id: result[0]['id'], message: result[0]['message'], created_at: DateTime.parse(result[0]['created_at']))
  end

end