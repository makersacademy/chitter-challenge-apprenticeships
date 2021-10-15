require 'pg'

class Peep
  def self.all
    connect = Peep.connect_db
    result = connect.exec("SELECT * FROM peeps ORDER BY date DESC, id DESC;")

    peeps = result.map do |peep| 
      Peep.new(msg: peep['message'], date: peep['date'], id: peep['id']) 
    end

    return peeps
  end

  def self.create(msg:)
    connect = Peep.connect_db
    date = Time.new
    connect.exec('INSERT INTO peeps (message, date) VALUES($1, $2)', [msg, date])
  end

  def self.connect_db
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    return PG.connect(dbname: db_name)
  end

  attr_reader :id, :msg, :date

  def initialize(msg:, date:, id:) 
    @id = id
    @date = date
    @msg = msg
  end
end
