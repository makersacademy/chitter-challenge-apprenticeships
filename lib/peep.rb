require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    peeps = []
    result = result.values
    time = result[0][2]
    result.each do |dict|
      peeps << dict[1]
    end
    for i in 0...peeps.count
      peeps[i] = "#{peeps[i]} - #{time}"
    end
    peeps
  end
end
