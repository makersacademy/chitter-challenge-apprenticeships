
require 'pg'
require 'time'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT message, posted FROM peeps')
    # binding.irb
    result.map { |peep| peep }

  end
end