class DatabaseConnection

  @connection
  def self.setup(dbname:)
    @connection = PG.connect(dbname: dbname)
  end

  def self.query(arguement)
    @connection.exec(arguement)
  end

  def self.connection
    @connection
  end
end
