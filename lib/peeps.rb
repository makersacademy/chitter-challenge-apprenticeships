class Peeps

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

end



#  'The weather is very gloomy',
#  'Back in lockdown!',
#  'Hope everyone is happy!'
#
