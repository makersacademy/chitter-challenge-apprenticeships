class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM peeps')
    result.map { |peep| peep ['message']}
  end
end