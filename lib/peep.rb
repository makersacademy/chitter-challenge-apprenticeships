require 'pg'

class Peep
  attr_reader :message, :created_at
  def initialize(message:, created_at:)
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
    result.map do |peep|
      Peep.new(message: peep['message'], created_at: peep['created_at'])
    end
  end

  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message, created_at")
    Peep.new(message: result[0]['message'], created_at: result[0]['created_at'])
  end

  def self.find(keyword:)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  result = connection.exec("SELECT message FROM peeps WHERE message LIKE '%#{keyword}%';")
  result.map do |peep|
    Peep.new(message: peep['message'], created_at: peep['created_at'])
  end 
  end
end
