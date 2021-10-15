require 'pg'

class Peep
  def self.all
    connect = Peep.connect_db
    result = connect.exec("SELECT * FROM peeps;")
    return result.map { |peep| Peep.new(msg: peep['message'], id: peep['id']) }
  end

  def self.create(msg:)
    connect = Peep.connect_db
    connect.exec('INSERT INTO peeps (message) VALUES($1)', [msg])
  end

  def self.connect_db
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    return PG.connect(dbname: db_name)
  end

  attr_reader :id, :msg

  def initialize(msg:, id:) 
    @id = id
    @msg = msg
  end
end
