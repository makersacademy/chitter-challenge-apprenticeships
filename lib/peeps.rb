class Peeps
  # def initialize
  # end

  def all
    connection = PG.connect(dbname: "chitter")
    result = connection.exec("SELECT message FROM peeps;")
    result.map { |peep| peep["message"] }
  end
end
