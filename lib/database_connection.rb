require 'pg'

class DatabaseConnection
  def self.setup
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.query(sql)
    @connection.exec(sql)
  end
end