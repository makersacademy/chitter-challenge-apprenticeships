class DatabaseConnection
  def self.setup(db_name)
    @connection = PG.connect(dbname: db_name)
  end

  def self.query(query, params = [])
    @connection.exec_params(query, params)
  end
end
