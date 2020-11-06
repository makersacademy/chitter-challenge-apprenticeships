# frozen literal string: true

class Cheep
  def self.db_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

  def self.add(message)
  end

  def self.list
    result = db_connection.exec('SELECT * FROM cheeps;')
    result.map { |cheep| cheep['message'] }
  end
end
