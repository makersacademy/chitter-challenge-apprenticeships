class Peeps

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

end



#  'The weather is very gloomy',
#  'Back in lockdown!',
#  'Hope everyone is happy!'
#
