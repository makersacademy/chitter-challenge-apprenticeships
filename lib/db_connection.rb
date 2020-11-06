require 'pg'

class DBConnection
  def self.query(database, query)
    begin
      con = PG.connect(dbname: test_or_dev_db(database))
      con.exec query
    ensure
      con.close if con
    end
  end

  private

  def self.test_or_dev_db(database)
    ENV['RACK_ENV'] == 'test' ? database + '_test' : database
  end
end
