require 'pg'

class Peeps
  def initialize
    @peep
  end

  def view_all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end

  result = connection.exec('SELECT * FROM peeps')
  result.map { |peeps| peeps['message'] }
  end

  def add_peep(peep)
    @peep = peep
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end
    result = connection.exec("INSERT INTO peeps (message) values ('#{@peep}')")
  end
end
