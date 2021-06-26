require 'pg'

class Peep 
  attr_reader :id, :message

  def initialize(id, message)
    @id = id
    @message = message
  end

  def self.all
    if ENV['EVIRONMENT'] = 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end 

    result = conn.exec('SELECT * FROM peeps;')
    result.map {|peep| Peep.new(peep['id'], peep['message'])}
  end
end