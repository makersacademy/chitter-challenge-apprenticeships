require 'pg'
require_relative 'model/peep'

class Database
  def self.init(db_name)
    @connection = PG.connect :dbname => db_name
    @connection.prepare('insert_peep', 'INSERT INTO peeps (created_at, message) VALUES (CURRENT_TIMESTAMP, $1)')
    p 'Set up db connection'
  end

  def self.peeps
    return @connection.exec('SELECT * from peeps').map { |it|
      Peep.new(it['id'], DateTime.parse(it['created_at']), it['message'])
    }
  end

  def self.peep(content)
    @connection.exec_prepared('insert_peep', [content])
  end
end