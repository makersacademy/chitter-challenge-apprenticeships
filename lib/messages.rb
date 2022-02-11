require 'pg'

class Messages
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * from peeps;")
    result.map { |peep| peep['message'] }
    # [
    #   "This is a peep!",
    #   "and another peep"
    # ]
  end
end
