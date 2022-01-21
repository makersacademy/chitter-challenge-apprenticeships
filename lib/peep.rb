require 'pg'

class Peep

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  attr_reader :id, :message

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], message: peep['message'])
    end   
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    peep = connection.exec_params("INSERT INTO peeps (message) 
      VALUES($1) RETURNING id, message", [message])
  end

end
