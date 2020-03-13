require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connectipn = PG.connect(dbname: 'chitter')
    end 

    result = connection.exec('SELECT * FROM peeps;')
    result.map { |peeps| peeps['message'] }
    # [
    #   'This is a peep!',
    #   'I saw a fox!'
    # ]
  end
end
