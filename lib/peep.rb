require 'pg'

class Peep

  def self.all
    connect = Peep.connect_db
    result = connect.exec("SELECT * FROM peeps;")
    result.map { |peep| { msg: peep.msg } }
  end

  def self.connect_db
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    return PG.connect(dbname: db_name)
  end
end
