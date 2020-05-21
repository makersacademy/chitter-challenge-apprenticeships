require 'pg'

class Chits
  def peeps
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps')
    messages = result.map { |message| message['message']}
  end
end


# array = %w(a b c)
# array.map.with_index { |ch, idx| [ch, idx] }
