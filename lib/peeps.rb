require 'pg'

class Peeps

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

def self.all

  if ENV['ENVIRONMENT'] == 'test'
    con = PG.connect(dbname: 'chitter_test')
  else
    con = PG.connect(dbname: 'chitter')
  end

  # time = con.exec("SELECT TO_CHAR(NOW() :: DATE, 'dd/mm/yyyy');")
  result = con.exec("SELECT * FROM peeps;")
  result.map {|peep| Peeps.new(id: peep['id'], message: peep['message'], date: peep['posting_date'])}
end


def self.create(message:)

  if ENV['ENVIRONMENT'] == 'test'
    con = PG.connect(dbname: 'chitter_test')
  else
    con = PG.connect(dbname: 'chitter')
  end

  result = con.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, posting_date;")
  Peeps.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['posting_date'])

end

end