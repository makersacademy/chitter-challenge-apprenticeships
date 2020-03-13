require 'pg'

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
  peeps = connection.exec("SELECT * FROM peeps;")
  peeps.map do |peep|
  Peep.new(id: peep['id'], message: peep['message'], created_at: peep['created_at'])
  end
end

def self.create(message:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
end
result = connection.exec("INSERT INTO peeps (message, created_at) VALUES ('#{message}', now());")
Peep.new(id: ['id'], message: ['message'], created_at: ['created_at'])
end
end
