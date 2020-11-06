require 'pg'

class DatabaseQuery
  def self.setup(db_name)
    p "Connecting to..." + db_name
    @@connection = PG.connect(dbname: db_name)
  end

  def self.query(sql)
    puts sql
    @@connection.exec(sql)
  end
end
