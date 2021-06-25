class DatabaseConnection
  def self.start
    ENV['ENVIRONMENT'] == 'test' ? PG.connect(dbname: 'chitter_test') : PG.connect(dbname: 'chitter')
  end

end