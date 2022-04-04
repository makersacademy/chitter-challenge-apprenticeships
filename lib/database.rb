require 'pg'
require_relative 'model/peep'

class Database
  def self.init(db_name)
    @connection = PG.connect :dbname => db_name
    @connection.prepare('insert_peep', 'INSERT INTO peeps (created_at, message) VALUES (CURRENT_TIMESTAMP, $1)')
    @connection.prepare('search_peeps', "SELECT * FROM peeps WHERE message ILIKE '%' || $1 || '%'")
    p 'Set up db connection'
  end

  def self._query_to_array(query)
    return query.map do |it|
      Peep.new(it['id'], DateTime.parse(it['created_at']), it['message'])
    end
  end

  def self.peeps
    return _query_to_array @connection.exec('SELECT * from peeps')
  end

  def self.peep(content)
    @connection.exec_prepared('insert_peep', [content])
  end

  # deletes all entries - used for testing only
  def self.do_not_call_this_method_empty_the_database
    @connection.exec('DELETE FROM peeps')
  end

  def self.search(query)
    return _query_to_array @connection.exec_prepared('search_peeps', [query])
  end
end