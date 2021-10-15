class Message
  def self.all
    if ENV['ENVIRONTMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peep| peep['message'] }
  end
end