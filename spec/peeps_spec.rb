require 'peeps'

describe Peeps do
  describe '.all' do
    it 'gives a list of all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('The weather is very gloomy');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Back in lockdown!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Hope everyone is happy!!');")

      peeps = Peeps.all

      expect(peeps).to include('The weather is very gloomy')
      expect(peeps).to include('Back in lockdown!')
      expect(peeps).to include('Hope everyone is happy!!')
    end
  end

describe '.create' do
  it 'creates a new peep' do
    Peeps.create(message: 'This is my first peep')

    expect(Peeps.all).to include 'This is my first peep'
  end
end

end
