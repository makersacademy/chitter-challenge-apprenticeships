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
end