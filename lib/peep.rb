require 'pg'

class Peep

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'])
    end
  end

  def self.add(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec_params(
      "INSERT INTO peeps (message) VALUES($1) RETURNING id, message;", [message]
      ).first
    Peep.new(id: result['id'], message: result['message'])
  end
end
